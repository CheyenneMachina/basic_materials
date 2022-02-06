local S = minetest.get_translator("basic_materials")
local chains_sbox = {type = "fixed",fixed = { -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 }}

local sound_api = loadfile(basic_materials.modpath .. "/sound_api_core/init.lua")
if not sound_api then
	sound_api = {}
	local metatable = {
		__index = function(_, _)
			return function(input)
				minetest.log(
					"warning",
					"[basic_materials]: " ..
					"The sound api submodule for game agnostic sound loading could not be found at " ..
					basic_materials.modpath .. "/sound_api_core. " ..
					"documentation for using submodules can be found at https://git-scm.com/docs/git-submodule." ..
					"defaulting back to mod provided input or nil."
				)
				if input then return input else return nil end
			end
		end,
	}
	setmetatable(sound_api, metatable)
end

minetest.register_node("basic_materials:cement_block", {
	description = S("Cement"),
	tiles = {"basic_materials_cement_block.png"},
	is_ground_content = true,
	groups = {cracky=2, dig_stone = 1},
	sounds = sound_api.node_sound_stone_defaults(),
})

minetest.register_node("basic_materials:concrete_block", {
	description = S("Concrete Block"),
	tiles = {"basic_materials_concrete_block.png",},
	groups = {cracky=1, concrete=1, dig_stone = 1},
	sounds = sound_api.node_sound_stone_defaults(),
})

minetest.register_node("basic_materials:chain_steel", {
	description = S("Chain (steel, hanging)"),
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_steel.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_steel_inv.png",
	groups = {cracky=3, dig_stone = 1},
	selection_box = chains_sbox,
})

minetest.register_node("basic_materials:chain_brass", {
	description = S("Chain (brass, hanging)"),
	drawtype = "mesh",
	mesh = "basic_materials_chains.obj",
	tiles = {"basic_materials_chain_brass.png"},
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	inventory_image = "basic_materials_chain_brass_inv.png",
	groups = {cracky=3, dig_stone = 1},
	selection_box = chains_sbox,
})

minetest.register_node("basic_materials:brass_block", {
	description = S("Brass Block"),
	tiles = { "basic_materials_brass_block.png" },
	is_ground_content = false,
	groups = {cracky=1, dig_stone = 1},
	sounds = sound_api.node_sound_metal_defaults()
})
