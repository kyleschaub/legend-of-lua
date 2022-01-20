--- TEsound v1.3, a simplified sound system for Love 2D
-- @author Ensayia (Ensayia@gmail.com) & Taehl (SelfMadeSpirit@gmail.com)
-- Edited by chameleon to work with 11.2
dj = {}        -- Namespace
dj.channels = {}   -- This holds the currently playing sound channels
dj.volumeLevels = {} -- Volume levels that multiply the volumes of sounds with those tags
dj.pitchLevels = {}  -- Pitch levels that multiply the pitches of sounds with those tags


-- Functions for playing sounds

--- Play a sound, or a random sound from a list. (with optional tag(s), volume, pitch, and on-finished function)
-- @param sound A filepath to the sound file (example: "sounds/jump.ogg"), or a list of filepaths. If a list is used, a random sound from that list will be played. Passing a string is shorthand for passing a table with only one item.
-- @param sourceType "stream" or "static"; use the latter for small files, the former for music.
-- @param tags One or more tags that can be used to identify a sound (Example, single: "music". Example, multiple: {"sfx", "gun", "player"}). Multiple sounds may share tags, or tags may be unique. If omitted, no tags are assigned. Passing a string is shorthand for passing a table with only one item.
-- @param volume A number between 0 and 1 which specifies how loud a sound is. If the sound has a tag which a volume has been specified for, it will multiply this number (ie., if you use the tag "sfx" and volume 0.5, and "sfx" has been tagVolume-ed to 0.6, then the sound will be played at 0.3 volume).
-- @param pitch A number which specifies the speed/pitch the sound will be played it. If the sound has a tag which a pitch has been specified for, it will multiply this number.
-- @param func A function which will be called when the sound is finished playing (it's passed one parameter - a list with the sound's volume and pitch). If omitted, no function will be used.
function dj.play(sound, sourceType, tags, volume, pitch, func)
  if type(sound) == "table" then
    assert(#sound > 0, "The list of sounds must have at least one sound.")
    sound = sound[love.math.random(#sound)]
  end
  if not (type(sound) == "string" or (type(sound) == "userdata" and sound:type() == "SoundData")) then
    error("You must specify a sound - a filepath as a string, a SoundData, or a table of them. Not a Source!")
  end
  if sourceType == nil or not (type (sourceType) == "string") then
     error ("In version 11, you must provide a sourceType (\"stream\" or \"static\")")
  end

  table.insert(dj.channels, { love.audio.newSource(sound, sourceType), func, {volume or 1, pitch or 1}, tags=(type(tags) == "table" and tags or {tags}) })
  local s = dj.channels[#dj.channels]
  s[1]:play()
  s[1]:setVolume( (volume or 1) * dj.findVolume(tags) * (dj.volumeLevels.all or 1) )
  s[1]:setPitch( (pitch or 1) * dj.findPitch(tags) * (dj.pitchLevels.all or 1) )
  return #dj.channels
end

--- Play a repeating sound, or random sounds from a list. (with optional tag(s), volume, and pitch)
-- @param sound See dj.play
-- @param sourceType "stream" or "static"; use the latter for small files, the former for music.
-- @param tags See dj.play
-- @param n The number of times the sound will be looped. If omitted, the sound will loop until dj.stop is used.
-- @param volume See dj.play
-- @param pitch See dj.play
function dj.playLooping(sound, sourceType, tags, n, volume, pitch)
  return dj.play( sound, sourceType, tags, volume, pitch,
    (not n or n > 1) and function(d) dj.playLooping(sound, sourceType, tags, (n and n-1), d[1], d[2]) end
  )
end


-- Functions for modifying sounds that are playing (passing these a tag instead of a string is generally preferable)

--- Sets the volume of channel or tag and its loops (if any).
-- Volume/pitch changes take effect immediately and last until changed again. Sound "tags" are recommended for changing multiple sounds together, so you can independently adjust the volume of all sound effects, music, etc. Just don't forget to tag your sounds! If a sound has multiple tags with set volumes, the first one (in the order of its tag list) will be used.
-- Example: dj.volume("music", .5))  -- set music to half volume
-- @param channel Determines which channel (number) or tag (string) will be affected. Since sound channels aren't static, it's advisable to use tags. The special sound tag "all" will always affect all sounds.
-- @param volume See dj.play. If omitted, effectively resets volume to 1.
function dj.volume(channel, volume)
  if type(channel) == "number" then
    local c = dj.channels[channel] volume = volume or c[3][1] c[3][1] = volume
    c[1]:setVolume( volume * dj.findVolume(c.tags) * (dj.volumeLevels.all or 1) )
  elseif type(channel) == "string" then dj.volumeLevels[channel]=volume for k,v in pairs(dj.findTag(channel)) do dj.volume(v, volume) end
  end
end

--- Sets the pitch of channel or tag and its loops (if any).
-- @param channel See dj.volume
-- @param pitch See dj.play. If omitted, effectively resets pitch to 1.
function dj.pitch(channel, pitch)
  if type(channel) == "number" then
    local c = dj.channels[channel] pitch = pitch or c[3][2] c[3][2] = pitch
    c[1]:setPitch( pitch * dj.findPitch(c.tags) * (dj.pitchLevels.all or 1) )
  elseif type(channel) == "string" then dj.pitchLevels[channel]=pitch for k,v in pairs(dj.findTag(channel)) do dj.pitch(v, pitch) end
  end
end

--- Pauses a channel or tag. Use dj.resume to unpause.
-- @param channel See dj.volume
function dj.pause(channel)
  if type(channel) == "number" then dj.channels[channel][1]:pause()
  elseif type(channel) == "string" then for k,v in pairs(dj.findTag(channel)) do dj.pause(v) end
  end
end

--- Resumes a channel or tag from a pause.
-- @param channel See dj.volume
function dj.resume(channel)
  if type(channel) == "number" then dj.channels[channel][1]:resume()
  elseif type(channel) == "string" then for k,v in pairs(dj.findTag(channel)) do dj.resume(v) end
  end
end

-- Stops a sound channel or tag either immediately or when finished and prevents it from looping.
-- @param channel See dj.volume
-- @param finish If true, the sound will be allowed to finish playing instead of stopping immediately.
function dj.stop(channel, finish)
  if type(channel) == "number" then local c = dj.channels[channel] c[2] = nil if not finish then c[1]:stop() end
  elseif type(channel) == "string" then for k,v in pairs(dj.findTag(channel)) do dj.stop(v, finish) end
  end
end


-- Utility functions

--- Cleans up finished sounds, freeing memory (highly recommended to go in love.update()). If not called, memory and channels won't be freed, and sounds won't loop.
function dj.cleanup()
  for k,v in ipairs(dj.channels) do
    if not v[1]:isPlaying() then
      if v[2] then v[2](v[3]) end   -- allow sounds to use custom functions (primarily for looping, but be creative!)
      table.remove(dj.channels, k)
    end
  end
end


-- Internal functions

-- Returns a list of all sound channels with a given tag.
-- @param tag The channels of all sounds with this tag will be returned.
-- @return A list of sound channel numbers.
function dj.findTag(tag)
  local t = {}
  for channel,sound in ipairs(dj.channels) do
    if sound.tags then for k,v in ipairs(sound.tags) do
      if tag == "all" or v == tag then table.insert(t, channel) end
    end end
  end
  return t
end

--- Returns a volume level for a given tag or tags, or 1 if the tag(s)'s volume hasn't been set. If a list of tags is given, it will return the level of the first tag with a set volume.
-- @param tag Chooses the tag to check the volume of.
-- @return volume, a number between 0 and 1 (if nil, defaults to 1).
function dj.findVolume(tag)
  if type(tag) == "string" then return dj.volumeLevels[tag] or 1
  elseif type(tag) == "table" then for k,v in ipairs(tag) do if dj.volumeLevels[v] then return dj.volumeLevels[v] end end
  end
  return 1
end

--- Returns a pitch level for a given tag or tags, or 1 if the tag(s)'s pitch hasn't been set.
-- @param tag See dj.findVolume
-- @return pitch, a number between 0 and 1 (if nil, defaults to 1).
function dj.findPitch(tag)
  if type(tag) == "string" then return dj.pitchLevels[tag] or 1
  elseif type(tag) == "table" then for k,v in ipairs(tag) do if dj.pitchLevels[v] then return dj.pitchLevels[v] end end
  end
  return 1
end