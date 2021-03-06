--
--CHICKEN
--
shamanmobs:register_mob("shamanmobs:chicken", {
	type = "monster",
	attack_type = "dogfight",
	hp_max = 1,
	collisionbox = {-0.25*(0.5/0.7), -0.33*(0.5/0.7), -0.25*(0.5/0.7), 0.25*(0.5/0.7), 0.33*(0.5/0.7), 0.25*(0.5/0.7)},
	visual = "cube",
	visual_size = { x = 0.5, y = 0.5},
	textures = {"chicken_top.png", "chicken_bot.png", "chicken_side.png", "chicken_side.png", "chicken_front.png", "chicken_bot.png"},
	makes_footstep_sound = false,
	view_range = 14,
	walk_velocity = 2,
	run_velocity = 2,
	armor = 100,
	damage = 1,
	drops = {
		{name = "shamanmobs:meat_raw",
		chance = 1,
		min = 1,
		max = 1,},
		},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	on_rightclick = function(self, clicker)
	tool = clicker:get_wielded_item():get_name()
		if tool == "shamanmobs:cage" then
				clicker:get_inventory():remove_item("main", "shamanmobs:cage")
				clicker:get_inventory():add_item("main", "shamanmobs:chicken")
				self.object:remove()
		elseif clicker:get_inventory() and not self.empty then
			self.empty = true
				clicker:get_inventory():add_item("main", "shamanmobs:egg")
				clicker:get_inventory():add_item("main", "shamanmobs:feather")
		end
	end,
})
	
minetest.register_craftitem("shamanmobs:chicken", {
	description = "Chicken",
	inventory_image = "chicken_front.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "shamanmobs:chicken")
			if minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			else 
				itemstack:take_item()
				placer:get_inventory():add_item("main", "shamanmobs:cage")
			end
		end
		return itemstack
	end,
})

minetest.register_craftitem("shamanmobs:egg", {
	description = "egg",
	inventory_image = "egg.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craftitem("shamanmobs:feather", {
	description = "feather",
	inventory_image = "feather.png",
})

minetest.register_node("shamanmobs:chicken_block", {
	description = "chicken block",
	tiles = {"chicken_top.png^[transformR180]", "chicken_bot.png", "chicken_side.png", "chicken_side.png", "chicken_bot.png", "chicken_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "shapeless",
	output = "shamanmobs:chicken_block",
	recipe = {"shamanmobs:chicken", "shamanmobs:chicken", "shamanmobs:chicken", "shamanmobs:chicken"}
})
