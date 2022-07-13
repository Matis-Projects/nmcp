if SERVER then
    include("nmcp/sv_config.lua")
    local config = GetNMCPConfig()
    include("nmcp/languages/" .. config["Modules"]["Languages"])
    
    function Start()
        local lng = GetLanguage()
        
        local version = "beta_1.1.5" --> Please don't touch this!
        local starttime = os.clock()
        print( "[NMCP] " .. lng["EVENT"]["HTTP-REQUEST"][1])
        http.Fetch( "https://raw.githubusercontent.com/Matis-Projects/nmcp/main/actual_version.txt",
            function( body, length, headers, code )
                print( "[NMCP] " .. lng["EVENT"]["HTTP-REQUEST"][2])
                -- The first argument is the HTML we asked for.
                local bod = string.Replace(body, "\n", "")
                if bod == version then
                    print( "[NMCP] " .. string.Replace(lng["EVENT"]["VERSION-CHECK"][1], "%1", version))
                else 
                    print( "[NMCP] " .. string.Replace(string.Replace(lng["EVENT"]["VERSION-CHECK"][2], "%1", version), "%2", bod))
                end
            end,
            function( message )
                print( "[NMCP] " .. lng["EVENT"]["HTTP-REQUEST"][3])
                print( "[NMCP] " .. lng["EVENT"]["VERSION-CHECK"][3])
            end,
            { 
                ["accept-encoding"] = "gzip, deflate",
                ["accept-language"] = "fr" 
            }
        )

        include("nmcp/server/sv_antinet.lua")
        include("nmcp/server/sv_physgun.lua")
    end
    
    Start()
    
	local as_loaded = false
    function PlayerSpawn(plr, transition)
        if not(as_loaded) then
            as_loaded = true
            Start()
		end
	end
    
	hook.Add("PlayerSpawn", "NMCP::Load", PlayerSpawn)
	--
	AddCSLuaFile("nmcp/client/cl_notify.lua")
else
    include("nmcp/client/cl_notify.lua")
end
