--nodes registration
minetest.register_node("scout_custom:ember_black", {
	description = "Black Ember",
	tiles = {"ember_black.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_blue", {
	description = "Blue Ember",
	tiles = {"ember_blue.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_dark_green", {
	description = "Dark Green Ember",
	tiles = {"ember_dark_green.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_dark_grey", {
	description = "Dark Grey Ember",
	tiles = {"ember_dark_grey.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_lime", {
	description = "Lime Ember",
	tiles = {"ember_lime.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_grey", {
	description = "Grey Ember",
	tiles = {"ember_grey.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_light_grey", {
	description = "Light Grey Ember",
	tiles = {"ember_light_grey.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_orange", {
	description = "Orange Ember",
	tiles = {"ember_orange.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_purple", {
	description = "Purple Ember",
	tiles = {"ember_purple.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:ember_red", {
	description = "Red Ember",
	tiles = {"ember_red.png"},
	groups = {oddly_breakable_by_hand=2},
})

minetest.register_node("scout_custom:ice_pine_tree", {
	description = "Ice Pine Tree",
	tiles = {"ice_pine_tree_top.png", "ice_pine_tree_top.png",
		"ice_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 3},
	on_place = minetest.rotate_node
})

minetest.register_node("scout_custom:ice_pine_wood", {
	description = "Ice Pine Wood",
	tiles = {"ice_pine_wood.png"},
	groups = {oddly_breakable_by_hand=2},
})

minetest.register_node("scout_custom:slush", {
	description = "Slush",
	tiles = {"slush.png"},
	groups = {oddly_breakable_by_hand=2},
})
minetest.register_node("scout_custom:compact_ice", {
	description = "Compact Ice",
	tiles = {"compact_ice.png"},
	groups = {oddly_breakable_by_hand=2},
})

minetest.register_node("scout_custom:dirty_snow", {
	description = "Dirty Snow",
	tiles = {"dirty_snow.png"},
	groups = {oddly_breakable_by_hand=2},
})
--snowy_leaves node registration
minetest.register_node("scout_custom:snowy_leaves", {
	description = "Snowy Leaves",
	drawtype = "allfaces_optional",
	tiles = {"snowy_leaves.png"},
	inventory_image = "snowy_leaves.png",
	wield_image = "snowy_leaves.png",
	paramtype = "light",
	walkable = true,
	waving = 1,
	groups = {snappy = 3, leafdecay = 3, leaves = 1, flammable = 2},
})
--recipes for items
minetest.register_craft({
	output = "scout_custom:ice_pine_wood 4",
	recipe = {{"scout_custom:ice_pine_tree"}}
})
--icy grass
minetest.register_node(":scout_custom:grass_1", {
	description = "Icy Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"icy_grass_1.png"},
	inventory_image = "icy_grass_3.png",
	wield_image = "icy_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("scout_custom:grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("scout_custom:grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i=2,5 do
	minetest.register_node(":scout_custom:grass_"..i, {
		description = "Icy Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"icy_grass_"..i..".png"},
		inventory_image = "icy_grass_"..i..".png",
		wield_image = "icy_grass_"..i..".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "icy:grass_1",
		groups = {snappy=3,flora=1,attached_node=1,not_in_creative_inventory=1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})
end
