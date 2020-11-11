#! /usr/bin/env lua

local sixtyones = 0xfffffffffffffff

assert(#('%x'):format(sixtyones) == 15, "Sub-60-bit integer support is not implemented")

local random, floor, insert = math.random, math.floor, table.insert

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

local left, right, var
if arg[1] == '-r' and #arg == 1 then
    left, right = base32(random(sixtyones)), base32(random(sixtyones))
    var = random(1, 4)
    var = ('89ab'):sub(var, var)
else
    local lo, mid, hi, seq, node
    lo, mid, hi, var, seq, node =
        arg[1]:match('^'..hex(8)..'%-?'..hex(4)..'%-?4'..
            hex(3)..'%-?([89abAB])'..hex(3)..'%-?'..hex(12))

    assert(lo, "Valid UUIDv4 not entered")

    left, right = base32(tonumber(lo..mid..hi, 16)), base32(tonumber(seq..node, 16))
end

print(table.concat({
    left:sub(1, 5), left:sub(6, 10),
    left:sub(11, 12)..var:upper()..right:sub(1, 2),
    right:sub(3, 7), right:sub(8, 12)}, '-'):lower())
