function PhysgunDrop( ply, ent )
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
hook.Add("PhysgunDrop", "NMCP::SV_PHYSGUN::PhysgunDrop", PhysgunDrop)

function PhysgunPickup( ply, ent )
	ent:SetPos(ent:GetPos())
	ent:SetCollisionGroup(1)
	ent:SetColor(Color(55,255,55,100))
	ent.freeze = true
end
hook.Add("PhysgunPickup", "NMCP::SV_PHYSGUN::PhysgunPickup", PhysgunPickup)

function OnPhysgunFreeze( weapon, phys, ent, ply )
	ent.freeze = false
end
hook.Add("OnPhysgunFreeze", "NMCP::SV_PHYSGUN::OnPhysgunFreeze", OnPhysgunFreeze)