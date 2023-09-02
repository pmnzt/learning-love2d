-- Converts an HSL color to RGB
local function HSLToRGB(h, s, l)
    if s == 0 then
        return l, l, l -- achromatic
    end

    h = h / 360 -- normalize hue value

    local q
    if l < 0.5 then
        q = l * (1 + s)
    else
        q = l + s - l * s
    end

    local p = 2 * l - q

    local function hueToRGB(p, q, t)
        if t < 0 then t = t + 1 end
        if t > 1 then t = t - 1 end
        if t < 1 / 6 then return p + (q - p) * 6 * t end
        if t < 1 / 2 then return q end
        if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
        return p
    end

    local r = hueToRGB(p, q, h + 1 / 3)
    local g = hueToRGB(p, q, h)
    local b = hueToRGB(p, q, h - 1 / 3)

    return r, g, b
end


return HSLToRGB