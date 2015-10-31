modifier_mage_frost_bolt = class({})

--------------------------------------------------------------------------------

function modifier_mage_frost_bolt:IsDebuff()
	return true
end

--------------------------------------------------------------------------------

function modifier_mage_frost_bolt:GetStatusEffectName()
	return "particles/status_fx/status_effect_frost_lich.vpcf"
end

function modifier_mage_frost_bolt:StatusEffectPriority()
	return 10
end

--------------------------------------------------------------------------------

function modifier_mage_frost_bolt:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}

	return funcs
end

--------------------------------------------------------------------------------

function modifier_mage_frost_bolt:GetModifierMoveSpeedBonus_Percentage( params )
	return self:GetAbility():GetSpecialValueFor( "slow" )
end

--------------------------------------------------------------------------------
