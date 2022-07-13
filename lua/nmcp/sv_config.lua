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
            ["Enabled"] = true -- Enable module
        }
    }
}

function GetNMCPConfig()
	return config
end