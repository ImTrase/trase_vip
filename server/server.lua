local function getStates(src)
    local allStates = {}
    for roleID, states in pairs(Config.VIPStates) do
        if exports.trase_discord:hasRole(tonumber(src), roleID) then
            for i = 1, #states do
                local state = states[i]
                Player(src).state:set(state, true, true)
                if Config.PrintConnect then
                    allStates[#allStates+1] = state
                end
            end
        end
    end

    if Config.PrintConnect then
        if #allStates > 0 then
            print(('^4[Trase_vip]^0: Player %s connected with state(s): %s'):format(GetPlayerName(src), table.concat(allStates, ', ')))
        end
    end
end

RegisterNetEvent('trase_discord:server:player_connected', function()
    local src = source
    Wait(500)
    getStates(src)
end)

-- On resource start
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for _, player in ipairs(GetPlayers()) do
            getStates(player)
        end
    end
end)