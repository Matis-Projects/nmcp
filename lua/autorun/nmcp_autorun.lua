if SERVER then
	local as_loaded = false
    function PlayerSpawn(plr, transition)
        if as_loaded then
            as_loaded = true
            local version = "beta_1.0" --> Please don't touch this!


            local starttime = os.clock()
            http.Fetch( "https://raw.githubusercontent.com/Matis-Projects/nmcp/main/actual_version.txt",
                function( body, length, headers, code )
                    -- The first argument is the HTML we asked for.
                    local bod = string.Replace(body, "\n", "")
                    if bod == version then
                        print( "[NMCP] This version of NMCP is the last version. (" .. version .. ")." )
                    else 
                        print( "[NMCP] This version isnot supported. Please update from " .. version .. " to " .. bod .. ".")
                    end
                end,
                function( message )
                    print( "[NMCP] Can't connect to NMCP server... (reason: " .. message .. ")." )
                    print( "[NMCP] Please check https://github.com/Matis-Projects/nmcp/releases to see if there is a update available." )
                end,
                { 
                    ["accept-encoding"] = "gzip, deflate",
                    ["accept-language"] = "fr" 
                }
            )

            include("nmcp/server/sv_antinet.lua")
            include("nmcp/server/sv_physgun.lua")
		end
	end
    
	hook.Add("PlayerSpawn", "NMCP::Load", PlayerSpawn)
end