modifier_mage_polymorph = class({})


function modifier_mage_polymorph:OnCreated()
	target = self:GetParent()
	if target.target_model == nil then
			target.target_model = target:GetModelName()
	end
	target:SetOriginalModel("models/items/hex/sheep_hex/sheep_hex.vmdl")
	self:StartIntervalThink(0.5)
end

function modifier_mage_polymorph:OnDestroy()	
	target = self:GetParent()
	if target.target_model ~= nil then
		target:SetModel(target.target_model)
		target:SetOriginalModel(target.target_model)
	end
end

function modifier_mage_polymorph:OnIntervalThink()
	target = self:GetParent()
	local amount = (target:GetMaxHealth() / 10)
	target:Heal(amount, target)
end


function modifier_mage_polymorph:CheckState()
	local state = {
	[MODIFIER_STATE_DISARMED] = true,
	[MODIFIER_STATE_MUTED] = true,
	[MODIFIER_STATE_HEXED] = true,
	[MODIFIER_STATE_EVADE_DISABLED] = true,
	}
 
	return state
end

function modifier_mage_polymorph:IsDebuff()
	return true
end

 
function modifier_mage_polymorph:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BASE_OVERRIDE,
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	}
 
	return funcs
end

function modifier_mage_polymorph:GetModifierMoveSpeedOverride()
	return 100;
end

function modifier_mage_polymorph:OnTakeDamage(event)
	self:GetParent():RemoveModifierByName("modifier_mage_polymorph")
end

--------------------------------------------------------------------------------
 
