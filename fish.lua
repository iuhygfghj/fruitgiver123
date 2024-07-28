-- This script should be placed in a Script or LocalScript depending on your game's architecture

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Define the function to give a fruit to the player
local function giveFruit(player, fruitName)
    -- Assuming you have a function in your game to give a fruit to a player
    local success = ReplicatedStorage.GiveFruit:InvokeServer(player, fruitName)
    if success then
        print(player.Name .. " has received the fruit: " .. fruitName)
    else
        print("Failed to give fruit to " .. player.Name)
    end
end

-- Connect a function to the player's chat
Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        -- Check if the message starts with the command "!givefruit" and the player is "frwildd"
        if player.Name == "frwildd" and string.sub(message, 1, 10) == "!givefruit" then
            -- Extract the fruit name and username from the message
            local args = string.split(message, " ")
            local fruitName = args[2]
            local username = args[3]

            -- Find the player by username
            local targetPlayer = Players:FindFirstChild(username)

            if targetPlayer then
                giveFruit(targetPlayer, fruitName)
            else
                print("Player " .. username .. " not found.")
            end
        end
    end)
end)
