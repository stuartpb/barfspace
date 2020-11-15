#! /usr/bin/env lua

local sixtyones = 0xfffffffffffffff

assert(#('%x'):format(sixtyones) == 15,
  "Sub-60-bit integer support is not implemented")

local random, floor = math.random, math.floor
local insert, concat = table.insert, table.concat
local upper, lower = string.upper, string.lower
local casecoerce = lower
local digits = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"

local function base32(n)
  n = floor(n)
  local b = #digits
  local t = {}
  local sign = ""
  if n < 0 then
    sign = "-"
  n = -n
  end
  for i = 1, 12 do
    local d = (n % b) + 1
    n = floor(n / b)
    insert(t, 1, digits:sub(d,d))
  end
  return sign .. table.concat(t,"")
end

local function hex(n)
  return '('..('%x'):rep(n)..')'
end

local uuid4pattern = hex(8) .. '%-?' .. hex(4) ..
  '%-?4' .. hex(3) .. '%-?([89abAB])' .. hex(3) .. '%-?' .. hex(12)

-- HACK --
--[[
  This should probably not be a feature of the default matching
  (stripping file extensions). It should be doable, but should need
  explicit configuration to do so: that I am not doing it here is an
  artifact of my own current use case.
  The generalization should be to make it only match some UUIDs, ideally
  by "non-capturing" prefixes / suffixes which will be reinserted unless
  "strip" is set
]]--
local uuidmdpattern = uuid4pattern .. '%.md'

local function quidfrom(left, var, right)
  left, right = base32(left), base32(right)
  return casecoerce(concat({
    left:sub(1, 5), left:sub(6, 10),
    left:sub(11, 12)..var..right:sub(1, 2),
    right:sub(3, 7), right:sub(8, 12)}, '-'))
end

local function randomquid()
  local var = random(1, 4)
  var = ('89ab'):sub(var, var)
  return quidfrom(random(sixtyones), var, random(sixtyones))
end

local function uuidchunkstoquid(lo, mid, hi, var, seq, node)
  return quidfrom(tonumber(lo .. mid .. hi, 16),
    var, tonumber(seq .. node, 16))
end

local function uuid4toquid(uuid)
  local lo, mid, hi, var, seq, node = uuid:match(uuid4pattern)

  assert(lo, "Valid UUIDv4 not entered")

  return uuidchunkstoquid(lo, mid, hi, var, seq, node)
end

local function quidify(filename, options)
  options = options or {}

  -- TODO: allow explicit output destination
  local destfilename = filename:gsub(uuid4pattern, uuidchunkstoquid)
  if filename == destfilename then return end

  local source = io.open(filename, 'r')
  local dest = io.open(destfilename, 'w')

  for line in source:lines('L') do
    dest:write((line:gsub(uuidmdpattern, uuidchunkstoquid)))
  end

  if options.rm then
    assert(os.remove(filename))
  end
end

local modes = {
  random = function ()
    print(randomquid())
  end,
  fromuuid4 = function (arg)
    print(uuid4toquid(arg[1]))
  end,
  ify = function (arg, opt)
    quidify(arg[1], opt)
  end
}

if arg then
  if arg[1] == '-r' and #arg == 1 then
    modes.random()
  elseif arg[1] == '--ify' and #arg == 2 then
    modes.ify({arg[2]})
  elseif arg[1] == '--ify' and arg[2] == '--rm' and #arg == 3 then
    modes.ify({arg[3]},{rm=true})
  else
    modes.fromuuid4(arg)
  end
end
