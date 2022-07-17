function isintable(table,value)
    local ret = false
	for k, v in pairs(table) do
    	if v == value then
            ret = true
		end
	end
    return ret
end

local classbl = {"info_player_start", "physgun_beam", "light_spot", "light", "trigger"}

local config = GetNMCPConfig()

function PhysgunDrop( ply, ent )
    if config["Modules"]["Physicgun-Limit"]["Enabled"] && cfg["Modules"]["Physicgun-Limit"]["Entities"]["Enabled"] then
        local found = false
        for k, v in pairs(ents.FindInSphere(ent:GetPos(), ent:GetModelRadius() /4)) do
            if not(isintable(classbl,v:GetClass())) && v:EntIndex() != ent:EntIndex() then
                found = true
                --break
            end
        end
        if not(found) then
            ent:SetPos(ent:GetPos())
            ent:SetCollisionGroup(0)
            ent:SetColor(Color(255,255,255,255))
            local phys = ent:GetPhysicsObject()
            phys:EnableMotion(false)
            timer.Create(ent:EntIndex() .. "UnfreezeEnt", 0.1, 1, function()
                if ent.freeze then
                    phys:EnableMotion(true)
                end
            end)
        end
	end
end
hook.Add("PhysgunDrop", "NMCP::SV_PHYSGUN::PhysgunDrop", PhysgunDrop)

function PhysgunPickup( ply, ent )
    if config["Modules"]["Physicgun-Limit"]["Enabled"] then
        if cfg["Modules"]["Physicgun-Limit"]["Entities"]["Enabled"] then
            ent:SetPos(ent:GetPos())
            ent:SetCollisionGroup(1)
            ent:SetColor(Color(55,55,55,100))
            ent.freeze = true
        end
        if ent:IsVehicle() && cfg["Modules"]["Physicgun-Limit"]["Vehicle"]["Enabled"] then
            if ply:IsAdmin() || ply:IsSuperAdmin() then
                return true
            else
                return false
            end
        end
    end
end
hook.Add("PhysgunPickup", "NMCP::SV_PHYSGUN::PhysgunPickup", PhysgunPickup)

function OnPhysgunFreeze( weapon, phys, ent, ply )
    if config["Modules"]["Physicgun-Limit"]["Enabled"] && cfg["Modules"]["Physicgun-Limit"]["Entities"]["Enabled"] then
        local found = false
        for k, v in pairs(ents.FindInSphere(ent:GetPos(), ent:GetModelRadius() /4)) do
            if not(isintable(classbl,v:GetClass())) && v:EntIndex() != ent:EntIndex() then
                found = true
                break
            end
        end
        if not(found) then
            ent.freeze = false
        else
            return false
        end
	end
end
hook.Add("OnPhysgunFreeze", "NMCP::SV_PHYSGUN::OnPhysgunFreeze", OnPhysgunFreeze)