local HSLToRGB = require("helper")

function love.load()
    -- Set the dimensions of the window
    love.window.setMode(800, 600)

    -- Initialize the position and velocity of the ball
    ball = {
        x = love.graphics.getWidth() / 2,
        y = 0,
        speed = 200,
        width = 90,
        height = 90,
        vely = 200,
        velx = 200
    }

    -- Set the color based on HSL values
    hue = 100 -- Yellow hue value
    saturation = 1
    lightness = 0.5
end

function love.update(dt)
    -- Update the position of the ball based on its velocity
    ball.y = ball.y + ball.vely * dt
    ball.x = ball.x + ball.velx * dt

    -- Reset the position of the ball if it goes off the screen
    if ball.y > love.graphics.getHeight() - ball.height or ball.y < 0 then
        ball.vely = -ball.vely
    end

     if ball.x > love.graphics.getWidth() - ball.width or ball.x < 0 then
        ball.velx = -ball.velx 
    end
end

function love.draw()
    -- Convert HSL to RGB
    local r, g, b = HSLToRGB(hue, saturation, lightness)

    -- Set the color based on the converted RGB values
    love.graphics.setColor(r, g, b)

    -- Draw the ball as a circle
    love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height, 20, 20)
end