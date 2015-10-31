mage_blink_lua = class({})
--LinkLuaModifier( "modifier_mage_blink_lua", LUA_MODIFIER_MOTION_NONE )

function mage_blink_lua:OnToggleOn()
	local caster = self:GetCaster()
	local distance = self:GetSpecialValueFor( "distance" )	
	local point = (caster:GetForwardVector() * distance) + caster:GetAbsOrigin()	

	--Modifier to remove stuns?
	--caster:AddNewModifier( caster, self, "modifier_mage_blink_lua", { duration = 0.1 } )

	caster:EmitSound("DOTA_Item.BlinkDagger.Activate")
	ParticleManager:CreateParticle("particles/items_fx/blink_dagger_start.vpcf", PATTACH_ABSORIGIN, caster)
	caster:SetAbsOrigin(point)
	ParticleManager:CreateParticle("particles/items_fx/blink_dagger_end.vpcf", PATTACH_ABSORIGIN, caster)
	FindClearSpaceForUnit( caster, point, true )
	--PlayerResource:SetCameraTarget(caster:GetPlayerID(), caster)
	--PlayerResource:SetCameraTarget(caster:GetPlayerID(), nil)
	ProjectileManager:ProjectileDodge(caster)

	-- Strong Dispel
	local RemovePositiveBuffs = false
	local RemoveDebuffs = false
	local BuffsCreatedThisFrameOnly = false
	local RemoveStuns = true
	local RemoveExceptions = false
	caster:Purge( RemovePositiveBuffs, RemoveDebuffs, BuffsCreatedThisFrameOnly, RemoveStuns, RemoveExceptions)

	self:ToggleAbility()
end


