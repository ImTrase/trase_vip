Config = {}

-- You can add more ranks if you want, [discordRoleID] = { 'state1', 'state2' }
Config.VIPStates = {
    [2525525252525252] = {
        'vip'
    },
    [1111744176170737684] = { -- I reccommend adding the above one, so for example VIP+ should also be considered a VIP
        'vip',
        'vip+'
    }
}

Config.PrintConnect = true -- If enabled it will enable prints when a player connects with a state