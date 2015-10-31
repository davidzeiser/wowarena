modifier_mage_blink_lua = class({})

function modifier_mage_blink_lua:CheckState()
	local state = {
	[MODIFIER_STATE_STUNNED] = false,
	}
 
	return state
end