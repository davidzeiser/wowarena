modifier_mage_ice_block = class({})


function modifier_mage_ice_block:OnCreated()
	local caster = self:GetCaster() 
	self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_jakiro/jakiro_ice_path_shards.vpcf", PATTACH_ABSORIGIN, caster )
	ParticleManager:SetParticleControl(self.particle, 0, caster:GetAbsOrigin())
	ParticleManager:SetParticleControl(self.particle, 1, caster:GetAbsOrigin())
end

function modifier_mage_ice_block:OnDestroy()	
	ParticleManager:DestroyParticle(self.particle,false)
	--if self:GetToggleState() == true then
		--self:ToggleAbility() 
	--end
end

function modifier_mage_ice_block:CheckState()
	local state = {	
	[MODIFIER_STATE_INVULNERABLE] = true,
	[MODIFIER_STATE_FROZEN] = true,
	[MODIFIER_STATE_STUNNED] = true,
	}
 
	return state
end

function modifier_mage_ice_block:IsDebuff()
	return false
end
 

