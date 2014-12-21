minetest.after(1,function()
	for _,player in ipairs(minetest.get_connected_players()) do
		minetest.register_on_newplayer(
			cf.add_user("unattached", player:get_player_name())
		
		)	
	end
end)
			
