local PLAYER = FindMetaTable( "Player" )

util.AddNetworkString("NMCP::NOTIFICATIONS")

local crt = CurTime()

function PLAYER:SendNotification(text, type, sound, time)
    if CurTime() > crt + 1 then
        crt = CurTime()
        net.Start("NMCP::NOTIFICATIONS")
        net.WriteString(text)
        net.WriteInt(type,4)
        net.WriteString(sound)
        net.WriteInt(time,7)
        net.Send(self)
    end
end