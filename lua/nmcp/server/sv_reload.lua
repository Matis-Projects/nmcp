
concommand.Add( "nmcp_reload", function( ply, cmd, args )
    LoadOtherScripts()
end )

function LoadOtherScripts()
    --REQUIRED:
    include("nmcp/server/sv_notify.lua")
    --OTHER:
    include("nmcp/server/sv_physgun.lua")
    include("nmcp/server/sv_menu.lua")
    local lng = GetLanguage()
    print("[NMCP] " .. lng["EVENT"]["RELOAD"][1])
end