--[[
    [EN]
    WARNING !
    This file is not a configuration file.
    To configure this addons, use the command nmcp_admin_menu !
    
    [FR]
    ATTENTION !
    Ce fichier n'est pas un fichier de configuration.
    Pour configurer cet addon, utiliser la commande nmcp_admin_menu !
]]--

function CreateConfigFile()
    include("nmcp/default_config.lua")
    if not(file.IsDir( "nmcp/", "DATA" )) then
        file.CreateDir( "nmcp/" )
    end
    local json = GetNMCPConfig()
    file.Write( "nmcp/config.json", util.TableToJSON(json))
    return json
end

function GetConfigFile()
    if file.Exists("nmcp/config.json", "DATA") then
        local cfg = util.JSONToTable(file.Read("nmcp/config.json", "DATA"))
        if VerifyConfigFile(cfg) then
            return cfg
        else
            return false
        end
    else
        return CreateConfigFile()
    end
end

function SetConfigFile(cfg)
    local y = VerifyConfigFile(cfg)
    if y then
        file.Write( "nmcp/config.json", util.TableToJSON(cfg))
        return true
    else
        return false
    end
end

function VerifyConfigFile(cfg)
    local ok = true
    
    -- Languages
    if vcf_ifexist(cfg["Modules"]["Languages"]) then 
        -- Module Anti-Net
        if vcf_ifexist(cfg["Modules"]["Anti-Net"]["Enabled"]) then 
            if vcf_ifexist(cfg["Modules"]["Anti-Net"]["HoneyPot"]["Auto-Start"]) then 
                if vcf_ifexist(cfg["Modules"]["Anti-Net"]["Analyse"]["Auto-Start"]) then
                    -- Module Physicgun Limitation
                    if vcf_ifexist(cfg["Modules"]["Physicgun-Limit"]["Enabled"]) then 
                        if vcf_ifexist(cfg["Modules"]["Physicgun-Limit"]["Entities"]["Enabled"]) then 
                            if vcf_ifexist(cfg["Modules"]["Physicgun-Limit"]["Vehicle"]["Enabled"]) then 
                                if vcf_ifexist(cfg["Modules"]["Physicgun-Limit"]["WhiteList"]["Vehicles"]) then 
                                    if vcf_ifexist(cfg["Modules"]["Physicgun-Limit"]["WhiteList"]["Other"]) then 
                                        ok = true
                                        -- Module Sync Ban Limitation
                                        /*if vcf_ifexist(cfg["Modules"]["SyncBan"]["Enabled"]) then 
                                            if vcf_ifexist(cfg["Modules"]["SyncBan"]["Send-Ban"]) then 
                                                if vcf_ifexist(cfg["Modules"]["SyncBan"]["Check-Player-When-He-Coming"]) then 
                                                    if vcf_ifexist(cfg["Modules"]["SyncBan"]["Warn-When-Coming"]) then 
                                                        if vcf_ifexist(cfg["Modules"]["SyncBan"]["Ban-When-Coming"]) then 
                                                            ok = true
                                                        else
                                                            ok = false
                                                        end
                                                    else
                                                        ok = false
                                                    end
                                                else
                                                    ok = false
                                                end
                                            else
                                                ok = false
                                            end
                                        else
                                            ok = false
                                        end*/
                                    else
                                        ok = false
                                    end
                                else
                                    ok = false
                                end
                            else
                                ok = false
                            end
                        else
                            ok = false
                        end
                    else
                        ok = false
                    end
                else
                    ok = false
                end
            else
                ok = false
            end
        else
            ok = false
        end
    else
        ok = false
    end

    return ok
end

function vcf_ifexist(link)
    local y = false
    if link != null then
        y = true
    end
    return y
end