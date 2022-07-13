local lng = GetLanguage()


function LoadAllNetworkID()
    http.Fetch( "https://api.matis-dev.tk/Addons/NMCP/?GetAll&all",
        function( body, length, headers, code )
            local json = util.JSONToTable(body)["return"]
            local unknown = {} --> Not known by the system. --> Wait until we known what is this net. --> State 4
            local warn = {} --> Is known as a dangerous net but not for malicious net --> Update all addons. --> State 2
            local safe = {} --> Is known as a "good" net. --> Nothing to do. --> State 3
            local bad = {} --> Is known as a malicious net. --> Contact your developper to remove it. --> State 1
            
            for i=1,4096 do
                local v = util.NetworkIDToString(i)
                if not(v == null) then
                    if net.Receivers[string.lower(v)] != null then 
                        local state = check_net(v,json)
                        local info = debug.getinfo(net.Receivers[string.lower(v)], "S")
                        print( "#" .. i .. " -> " .. v .. " -> " .. state .. " -> " .. info.short_src .. " -> " .. info.linedefined )
					end
                else
                    break
                end
            end
            print("[NMCP ~ ANALYSE] " .. lng["CMD"]["ANALYSE"][2])
        end,
        function( message )
           	test = false
            print( "Can't connect to NMCP server... (reason: " .. message .. ")" )
        end,
        { 
            ["accept-encoding"] = "gzip, deflate",
            ["accept-language"] = "fr" 
        }
    )
end

function HoneyPot()
    http.Fetch( "https://api.matis-dev.tk/Addons/NMCP/?GetAll&bad",
        function( body, length, headers, code )
            local json = util.JSONToTable(body)["return"]
            local rndn = math.random( 1, 5 )
            local netsel = ""
            for i=1,rndn do
                local hp = math.random( 1, table.Count(json) )
                local hpt = json[hp]
                while net.Receivers[string.lower(hpt)] != null do
                	hp = math.random( 1, table.Count(json) )
                	hpt = json[hp]
                end
                if net.Receivers[string.lower(hpt)] == null then 
                    netsel = netsel .. hpt .. ","
				
                    util.AddNetworkString(hpt)
                    net.Receive(hpt, function(len, plr)
                        InstantBan(plr, hpt)    
                    end)
                end
            end
            string.sub(netsel, 1, string.len(netsel) - 1)
            print("[NMCP ~ ANALYSE] " .. string.Replace(lng["CMD"]["HONEYPOT"][2], "%1", netsel))
            print("[NMCP ~ ANALYSE] " .. lng["CMD"]["HONEYPOT"][3])
        end,
        function( message )
           	test = false
            print( "Can't connect to NMCP server... (reason: " .. message .. ")" )
        end,
        { 
            ["accept-encoding"] = "gzip, deflate",
            ["accept-language"] = "fr" 
        }
    )
end

function InstantBan(plr, net)
    banplayer(plr, "(NMCP) A net exploit as been detected. (" .. net .. ")")
    print("The player " .. plr:Name() .. " (" .. plr:SteamID() .. ") has called this net: " .. net )
end

function banplayer(ply, reason)
    if istable(gBan) and isfunction(gBan.PlayerBan) then
       gBan:PlayerBan(nil, ply, 0, reason) 
	elseif istable(GExtension) and isfunction(GExtension.Ban) then
        ply:GE_Ban(0, reason, 0)
	elseif istable(FAdmin) and istable(FAdmin.Commands) and istable(FAdmin.Commands.List) and isfunction(FAdmin.Commands.List["ban"]) then
        RunConsoleCommand("_FAdmin", "ban", ply:SteamID(), "execute", 0, reason)
	elseif istable(ULib) and isfunction(ULib.ban) then
        ULib.ban(ply, 0, reason)
	elseif true then
        ply:Ban(0, false)
		ply:Kick(reason)
	end
end

function check_net(name, table)
    local state = 4
    local finded = false
    if finded == false && table["bad"] != null then
        state = 1
        for k, v in pairs(table["bad"]) do
            if name == v then
                finded = true
                break
            end
        end
    end
    if finded == false && table["warn"] != null then
        state = 2
        for k, v in pairs(table["warn"]) do
            if name == v then
                finded = true
                break
            end
        end
    end
    if finded == false && table["safe"] != null then
        state = 3
        for k, v in pairs(table["safe"]) do
            if name == v then
                finded = true
                break
            end
        end
    end
    if finded == false && table["unknown"] != null then
        state = 4
        for k, v in pairs(table["unknown"]) do
            if name == v then
                finded = true
                break
            end
        end
    end
    return state
end

concommand.Add( "nmcp", function( ply, cmd, args )
	if args[1] == "analyse" then
        print("[NMCP ~ ANALYSE] " .. lng["CMD"]["ANALYSE"][1])
		LoadAllNetworkID()
    elseif args[1] == "honeypot" then
        print("[NMCP ~ ANALYSE] " .. lng["CMD"]["HONEYPOT"][1])
		HoneyPot()
    elseif args[1] == "debug" then
        PrintTable(net.Receivers)
    elseif args[1] == "help" then
		print("[NMCP] " .. lng["CMD"]["HELP"][1])
        print("[NMCP] nmcp analyse ---> " .. lng["CMD"]["HELP"][2])
        print("[NMCP] nmcp debug -----> for test.")
        print("[NMCP] nmcp help ------> " .. lng["CMD"]["HELP"][3])
        print("[NMCP] nmcp honeypot --> " .. lng["CMD"]["HELP"][4])
    else
		print("[NMCP] " .. lng["CMD"]["ERROR"][1])
	end
end)