shamanmobs:register_mob("shamanmobs:green_saproling", {
	type = "monster",
	follow = true,
	hp_max = 5,
	collisionbox = {-0.4, -0.1, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "shamanmobs_green_saproling.x",
	textures = {"shamanmobs_green_saproling.png"},
	visual_size = {x=4.5,y=4,5},
	makes_fooststep_sound = true,
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	damage = 2,
	drops = {
		{name = "default:sapling",
		chance = 3,
		min = 1,
		max = 2,},
		{name = "default:junglesapling",
		chance = 3,
		min = 1,
		max = 2,},
	},
	light_resistant = true,
	armor = 100,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	disable_fall_damage = true,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 24,
		walk_start = 25,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		punch_start = 48,
		punch_end = 62,
	},
})
shamanmobs:register_spawn{"shamanmobs:green_saproling", {"default:leaves", "default:jungleleaves"}, 3, -1, 7000, 3, 31000}

