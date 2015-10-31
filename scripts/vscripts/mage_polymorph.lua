mage_polymorph = class({})
LinkLuaModifier( "modifier_mage_polymorph", LUA_MODIFIER_MOTION_NONE )

function mage_polymorph:OnChannelFinish(failed)
	
	if failed == false then
		local caster = self:GetCaster()
		local target = self:GetCursorTarget()
		self.mage_polymorph_duration = self:GetSpecialValueFor( "mage_polymorph_duration" )	
		target:AddNewModifier(caster, self, "modifier_mage_polymorph", { duration = self.mage_polymorph_duration } )
		ParticleManager:CreateParticle("particles/units/heroes/hero_shadowshaman/shadowshaman_voodoo.vpcf", PATTACH_ABSORIGIN, target)
		--caster:EmitSound("DOTA_Item.BlinkDagger.Activate")
	end
end


