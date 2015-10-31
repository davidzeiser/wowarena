mage_frost_bolt = class({})
LinkLuaModifier( "modifier_mage_frost_bolt", LUA_MODIFIER_MOTION_NONE )

require "spellbonus"
require "popup"

function mage_frost_bolt:OnChannelFinish(failed)
	
	if failed == false then		
		local info = {
			EffectName = "particles/units/heroes/hero_crystalmaiden/maiden_base_attack.vpcf",
			Ability = self,
			iMoveSpeed = self:GetSpecialValueFor( "proj_speed" ),
			Source = self:GetCaster(),
			Target = self:GetCursorTarget(),
			iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_2
		}

		ProjectileManager:CreateTrackingProjectile( info )
	end
end

function mage_frost_bolt:OnProjectileHit( hTarget, vLocation )
	if hTarget ~= nil and ( not hTarget:IsInvulnerable() ) and ( not hTarget:TriggerSpellAbsorb( self ) ) and ( not hTarget:IsMagicImmune() ) then		
		local slow_duration = self:GetSpecialValueFor( "slow_duration" )
		local frost_bolt_damage = self:GetSpecialValueFor( "damage" )
		local spellbonus = CalculateSpellBonus({
			base_damage = frost_bolt_damage,
			base_crit = self:GetSpecialValueFor( "base_crit" ),
			coef = self:GetSpecialValueFor( "spell_coef" ),
			caster = self:GetCaster()
		})
		
		if spellbonus.Crit then
			ShowPopup({
				Target = hTarget,
    			Type = POPUP_SYMBOL_TYPE_CRIT,
    			Color = Vector( 255, 0, 0 ),
    			Number = spellbonus.Damage,
    			Duration = 3
			})
		else
			ShowPopup({
				Target = hTarget,
    			Color = Vector( 255, 255, 0 ),
    			Type = POPUP_SYMBOL_TYPE_NORMAL,
    			Number = spellbonus.Damage,
    			Duration = 2
			})
		end

		local damage = {
			victim = hTarget,
			attacker = self:GetCaster(),
			damage = tonumber(spellbonus.Damage),
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}

		ApplyDamage( damage )
		hTarget:AddNewModifier( self:GetCaster(), self, "modifier_mage_frost_bolt", { duration = slow_duration } )
	end

	return true
end

function mage_frost_bolt:GetChannelAnimation()
	return ACT_DOTA_CAST_ABILITY_2
end


