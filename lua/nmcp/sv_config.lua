local config = {
	["Modules"] = {
    	["Languages"] = "en.lua",
        ["Anti-Net"] = {
            ["Enabled"] = true, -- Enable module.
            ["HoneyPot"] = {
                ["Auto-Start"] = true -- When the server start, enable honeypot
            },
            ["Analyse"] = {
                ["Auto-Start"] = true -- When the server start, execute anaylse
            }
        },
        ["Physicgun-Limit"] = {
            ["Enabled"] = true, -- Enable module
            ["Entities"] = {
                ["Enabled"] = true             
            },
            ["Vehicle"] = {
                ["Enabled"] = true
            }
        },
        ["SyncBan"] = {
            ["Enabled"] = true, -- Enable module.
            ["Send-Ban"] = false, -- When Anti-Net detect a player exploiting a net, send to NMCP database his steamid for warn another server from his action.
            ["Check-Player-When-He-Coming"] = true, -- Check if the player has been detected by NMCP and if he is in the NMCP database.
            ["Warn-When-Coming"] = true, -- When a player has been detected by NMCP and is in the NMCP database, warn all admins for his action.
            ["Ban-When-Coming"] = false -- WHen a player has been detected by NMCP and is in the NMCP database, ban him from the server.
        },
    }
}

function GetNMCPConfig()
	return config
end