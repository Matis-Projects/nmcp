util.AddNetworkString("NMCP::ADMIN-MENU")
net.Receive("NMCP::ADMIN-MENU", function(len,ply)
    if ply:IsSuperAdmin() then
		net.Start("NMCP::ADMIN-MENU")
		net.WriteBool(true)
		net.Send(ply)
	else
		net.Start("NMCP::ADMIN-MENU")
		net.WriteBool(false)
		net.Send(ply)
	end
end)