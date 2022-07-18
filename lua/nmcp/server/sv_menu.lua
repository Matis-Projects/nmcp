util.AddNetworkString("NMCP::ADMIN-MENU")
util.AddNetworkString("NMCP::ADMIN-MENU-ACT")
net.Receive("NMCP::ADMIN-MENU", function(len,ply)
    if ply:IsSuperAdmin() then
		net.Start("NMCP::ADMIN-MENU")
		net.WriteBool(true)
		net.WriteTable(GetConfigFile())
		net.WriteTable(file.Find( "nmcp/languages/*.lua", "LUA" ))
		net.Send(ply)
	else
		net.Start("NMCP::ADMIN-MENU")
		net.WriteBool(false)
		net.Send(ply)
	end
end)

net.Receive("NMCP::ADMIN-MENU-ACT", function(len,ply)
	local action = net.ReadString()
	if action == "Set-Config" then
		local cfg = net.ReadTable()
		local tcfg = SetConfigFile(cfg)
		net.Start("NMCP::ADMIN-MENU-ACT")
		net.WriteString("Set-Config")
		net.WriteTable(cfg)
		net.WriteBool(tcfg)
		net.Send(ply)
	end
end)