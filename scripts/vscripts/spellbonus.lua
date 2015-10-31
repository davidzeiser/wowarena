SPELL_CRIT_MULTIPLIER = 1.5
ITEM_TEST_SPELL_DAMAGE = 100
ITEM_TEST_SPELL_CRIT = 50


function CalculateSpellBonus(data)
	if not data then return end
	local base_damage = tonumber( data.base_damage or nil )
	local crit = tonumber( data.base_crit or nil )
	local coef = tonumber( data.coef or nil )
	local caster = data.caster
	local c = false
	local d = base_damage
	local spellpower = nil

	if caster:HasItemInInventory("item_test_spell_damage") then
		local item_bonus = caster:FindModifierByNameAndCaster("modifier_item_test_spell_damage",caster)
		d = d + math.ceil(ITEM_TEST_SPELL_DAMAGE * coef)
		crit = crit + ITEM_TEST_SPELL_CRIT
	end

	print("SPELL TOTAL DAMAGE PRE CRIT: "..d)
	if RollPercentage(crit) then
		d = math.ceil(d * SPELL_CRIT_MULTIPLIER)
		c = true
	end

	local result = {
		Damage = d,
		Crit = c
	}
	return result
end