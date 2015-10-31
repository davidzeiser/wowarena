mage_ice_block = class({})
LinkLuaModifier( "modifier_mage_ice_block", LUA_MODIFIER_MOTION_NONE )

function mage_ice_block:OnToggle()
	local caster = self:GetCaster()
	self.ice_block_duration = self:GetSpecialValueFor( "ice_block_duration" )
	
	if self:GetToggleState() == true then
	
		-- Strong Dispel
		local RemovePositiveBuffs = false
		local RemoveDebuffs = true
		local BuffsCreatedThisFrameOnly = false
		local RemoveStuns = true
		local RemoveExceptions = false
		caster:Purge( RemovePositiveBuffs, RemoveDebuffs, BuffsCreatedThisFrameOnly, RemoveStuns, RemoveExceptions)
		caster:AddNewModifier( caster, self, "modifier_mage_ice_block", { duration = self.ice_block_duration } )
	
	else
		caster:RemoveModifierByName("modifier_mage_ice_block")
	end
end

