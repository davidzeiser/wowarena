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
	[MODIFIER_STATE_STUNNED] = true,
	[MODIFIER_STATE_INVULNERABLE] = true,
	[MODIFIER_STATE_FROZEN] = true,
	}
 
	return state
end

function modifier_mage_ice_block:IsDebuff()
	return false
end

 
function modifier_mage_ice_block:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}
 
	return funcs
end
 
--------------------------------------------------------------------------------
 
function modifier_mage_ice_block:GetOverrideAnimation( params )
	return ACT_DOTA_DISABLED
end
