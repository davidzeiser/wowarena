mage_blink = class({})


function mage_blink:OnToggle()
	
	if self:GetToggleState() == true then
	local caster = self:GetCaster()
	local distance = self:GetSpecialValueFor( "distance" )	
	local point = (caster:GetForwardVector() * distance) + caster:GetAbsOrigin()	

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
	local RemoveDebuffs = true
	local BuffsCreatedThisFrameOnly = false
	local RemoveStuns = true
	local RemoveExceptions = false
	caster:Purge( RemovePositiveBuffs, RemoveDebuffs, BuffsCreatedThisFrameOnly, RemoveStuns, RemoveExceptions)

	self:ToggleAbility()
	end
end


