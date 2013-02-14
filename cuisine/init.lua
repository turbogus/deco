--cuisine:frigo_haut
--cuisine:frigo_bas

--cuisine:bleu_haut_meuble_simple
--cuisine:bleu_haut_meuble_double
--cuisine:bleu_haut_meuble_hotte
--cuisine:bleu_bas_meuble_simple
--cuisine:bleu_bas_meuble_double
--cuisine:bleu_bas_meuble_four
--cuisine:plan_travail
--cuisine:bleu_bas_meuble_evier



--DECLARATION DES BLOCS

--cuisine:frigo_haut
minetest.register_craft({
	output = "cuisine:frigo_haut",
	recipe = {
		{"default:sandstone","default:sandstone","default:sandstone"},
		{"default:sandstone","","default:sandstone"},
		{"default:steel_ingot","default:sandstone","default:sandstone"},
	}
})

--cuisine:frigo_bas
minetest.register_craft({
	output = "cuisine:frigo_bas",
	recipe = {
		{"default:sandstone","default:sandstone","default:sandstone"},
		{"default:sandstone","","default:sandstone"},
		{"default:sandstone","default:sandstone","default:sandstone"},
	}
})

--cuisine:bleu_haut_1
minetest.register_craft({
	output = "cuisine:bleu_haut_1",
	recipe = {
		{"default:chest"},
		{"dye:blue"},
	}
})

--cuisine:bleu_haut_2
minetest.register_craft({
	output = "cuisine:bleu_haut_2",
	recipe = {
		{"default:chest","default:chest",""},
		{"","dye:blue",""},
		{"","",""},
	}
})

--cuisine:bleu_hotte
minetest.register_craft({
	output = "cuisine:bleu_hotte",
	recipe = {
		{"","default:chest",""},
		{"","dye:blue",""},
		{"","default:glass",""},
	}
})

--cuisine:bleu_bas_1
minetest.register_craft({
	output = "cuisine:bleu_bas_1",
	recipe = {
		{"","",""},
		{"","dye:blue",""},
		{"","default:chest",""},
	}
})

--cuisine:bleu_bas_2
minetest.register_craft({
	output = "cuisine:bleu_bas_2",
	recipe = {
		{"","",""},
		{"","dye:blue",""},
		{"default:chest","default:chest",""},
	}
})

--cuisine:four
minetest.register_craft({
	output = "cuisine:four",
	recipe = {
		{"","default:torch",""},
		{"","default:glass",""},
		{"","default:furnace",""},
	}


})
--cuisine:plan_travail
minetest.register_craft({
	output = "cuisine:plan_travail",
	recipe = {
		{"default:wood","default:wood","default:wood"},
		{"default:wood","","default:wood"},
		{"default:wood","","default:wood"},
	}


})

--cuisine:evier
minetest.register_craft({
	output = "cuisine:evier",
	recipe = {
		{"","bucket:bucket_water",""},
		{"","dye:blue",""},
		{"","default:chest",""},
	}


})


--PAPRAMETRES DES BLOCS

--cuisine:frigo_haut
minetest.register_node("cuisine:frigo_haut", {
	description = "partie haute du frigo",
	tiles = {"frigo_dessus.png","frigo_dessous.png","frigo_cote.png",
		"frigo_cote.png","frigo_cote.png","frigo_haut_devant.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--cuisine:frigo_bas
minetest.register_node("cuisine:frigo_bas", {
	description = "partie basse du frigo",
	tiles = {"frigo_dessus.png","frigo_dessous.png","frigo_cote.png",
		"frigo_cote.png","frigo_cote.png","frigo_bas_devant.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--regroupement des frigos haut et bas
minetest.register_alias("frigo_haut", "cuisine:frigo_haut")
minetest.register_alias("frigo_bas", "cuisine:frigo_bas")

minetest.register_abm({
	nodenames = {"cuisine:frigo_bas"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local pos={x=pos.x, y=pos.y, z=pos.z}
		local pos2={x=pos.x, y=pos.y+1, z=pos.z}
		if minetest.env:get_node(pos).name=="cuisine:frigo_bas" then
			minetest.env:place_node(pos2, {name="frigo_haut"})
			--minetest.env:place_node(pos).name=="deco:frigo_haut"
		
		end
	end,

})

--cuisine:cuisine_bleu_haut_1
minetest.register_node("cuisine:bleu_haut_1", {
	description = "meuble haut simple",
	tiles = {"bleu_dessus.png","bleu_dessus.png","bleu_haut_cote.png",
		"bleu_haut_cote.png","bleu_haut_cote.png","bleu_haut_1.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--cuisine:bleu_haut_2
minetest.register_node("cuisine:bleu_haut_2", {
	description = "meuble haut double",
	tiles = {"bleu_dessus.png","bleu_dessus.png","bleu_haut_cote.png",
		"bleu_haut_cote.png","bleu_haut_cote.png","bleu_haut_2.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--cuisine:bleu_hotte
minetest.register_node("cuisine:bleu_hotte", {
	description = "meuble haut avec hotte aspirante",
	tiles = {"bleu_dessus.png","bleu_hotte_dessous.png","bleu_hotte_cote.png",
		"bleu_hotte_cote.png","bleu_hotte_cote.png","bleu_hotte.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--cuisine:bleu_bas_1
minetest.register_node("cuisine:bleu_bas_1", {
	description = "meuble bas simple",
	tiles = {"plan_travail.png","bleu_dessous.png","bleu_bas_cote.png",
		"bleu_bas_cote.png","bleu_bas_cote.png","bleu_bas_1.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--cuisine:bleu_bas_2
minetest.register_node("cuisine:bleu_bas_2", {
	description = "meuble bas double",
	tiles = {"plan_travail.png","bleu_dessous.png","bleu_bas_cote.png",
		"bleu_bas_cote.png","bleu_bas_cote.png","bleu_bas_2.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})

--cuisine:four
minetest.register_node("cuisine:four", {
	description = "four avec plaque de cuisson integree",
	tiles = {"plaque_cuisson.png", "bleu_dessus.png", "bleu_bas_cote.png",
		"bleu_bas_cote.png", "bleu_bas_cote.png", "four_off.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	--sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", default.furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
})

minetest.register_node("cuisine:four_on", {
	description = "four avec plaque de cuisson integree",
	tiles = {"plaque_cuisson.png", "bleu_dessus.png", "bleu_bas_cote.png",
		"bleu_bas_cote.png", "bleu_bas_cote.png", "four_on.png"},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "cuisine:four",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	--sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", default.furnace_inactive_formspec)
		meta:set_string("infotext", "Furnace");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
})

function hacky_swap_node(pos,name)
	local node = minetest.env:get_node(pos)
	local meta = minetest.env:get_meta(pos)
	local meta0 = meta:to_table()
	if node.name == name then
		return
	end
	node.name = name
	local meta0 = meta:to_table()
	minetest.env:set_node(pos,node)
	meta = minetest.env:get_meta(pos)
	meta:from_table(meta0)
end

minetest.register_abm({
	nodenames = {"cuisine:four","cuisine:four_on"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.env:get_meta(pos)
		for i, name in ipairs({
				"fuel_totaltime",
				"fuel_time",
				"src_totaltime",
				"src_time"
		}) do
			if meta:get_string(name) == "" then
				meta:set_float(name, 0.0)
			end
		end

		local inv = meta:get_inventory()

		local srclist = inv:get_list("src")
		local cooked = nil
		
		if srclist then
			cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
			meta:set_float("fuel_time", meta:get_float("fuel_time") + 1)
			meta:set_float("src_time", meta:get_float("src_time") + 1)
			if cooked and cooked.item and meta:get_float("src_time") >= cooked.time then
				-- check if there's room for output in "dst" list
				if inv:room_for_item("dst",cooked.item) then
					-- Put result in "dst" list
					inv:add_item("dst", cooked.item)
					-- take stuff from "src" list
					srcstack = inv:get_stack("src", 1)
					srcstack:take_item()
					inv:set_stack("src", 1, srcstack)
				else
					print("Could not insert '"..cooked.item:to_string().."'")
				end
				meta:set_string("src_time", 0)
			end
		end
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			local percent = math.floor(meta:get_float("fuel_time") /
					meta:get_float("fuel_totaltime") * 100)
			meta:set_string("infotext","Furnace active: "..percent.."%")
			hacky_swap_node(pos,"cuisine:four_on") --*
			meta:set_string("formspec",
				"size[8,9]"..
				"image[2,2;1,1;default_furnace_fire_bg.png^[lowpart:"..
						(100-percent)..":default_furnace_fire_fg.png]"..
				"list[current_name;fuel;2,3;1,1;]"..
				"list[current_name;src;2,1;1,1;]"..
				"list[current_name;dst;5,1;2,2;]"..
				"list[current_player;main;0,5;8,4;]")
			return
		end

		local fuel = nil
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		if fuellist then
			fuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if fuel.time <= 0 then
			meta:set_string("infotext","Furnace out of fuel")
			hacky_swap_node(pos,"cuisine:four")
			meta:set_string("formspec", default.furnace_inactive_formspec)
			return
		end

		if cooked.item:is_empty() then
			if was_active then
				meta:set_string("infotext","Furnace is empty")
				hacky_swap_node(pos,"cuisine:four")
				meta:set_string("formspec", default.furnace_inactive_formspec)
			end
			return
		end

		meta:set_string("fuel_totaltime", fuel.time)
		meta:set_string("fuel_time", 0)
		
		local stack = inv:get_stack("fuel", 1)
		stack:take_item()
		inv:set_stack("fuel", 1, stack)
	end,
})

--cuisine:plan_travail
minetest.register_node("cuisine:plan_travail", {
	description = "plan de travail",
	tiles = {"plan_travail.png"},
	is_ground_content = false,
	paramtype2 = "facedir",
	drop = "cuisine:plan_travail",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	
})

--cuisine:evier
minetest.register_node("cuisine:evier", {
	description = "meuble avec evier",
	tiles = {"evier.png","bleu_dessous.png","bleu_bas_cote.png",
		"bleu_bas_cote.png","bleu_bas_cote.png","bleu_bas_2.png"},
	paramtype2 = "facedir",
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	legacy_facedir_simple = true,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				"list[current_name;main;0,0;8,4;]"..
				"list[current_player;main;0,5;8,4;]")
		meta:set_string("infotext", "Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff in chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" moves stuff to chest at "..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
				" takes stuff from chest at "..minetest.pos_to_string(pos))
	end,
})