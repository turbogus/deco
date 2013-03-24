--MOD deco

--Cree par turbogus

-- code licence gpl v2 ou superieur
-- graphisme sous licence CC-BY-NC-SA

--plan :
--Liste des blocs
--Déclaration des crafts
--Paramatres des blocs et panneaux

--Liste des blocs:

--block_zone_danger
--chute
--chute_objet
--danger
--mine
--mort
--pierre_bleu
--pierre_grise
--pierre_orange
--rubik
--store

--tv_bas
--tv_bas_droit
--tv_bas_gauche
--tv_haut
--tv_gauche
--tv_droit
--tv_haut_droit
--tv_haut_gauche
--tv_milieu

--frigo_haut
--frigo_bas


-- ++++++++++++++++++++++++
-- |Declaration des crafts|
-- ++++++++++++++++++++++++

--bloc : block_zone_danger
minetest.register_craft({
	output = "deco:block_zone_danger 10",
	recipe = {
		{"default:sand", "default:sandstone"},
		{"default:sandstone", "default:sand"},
	}
})

--panneau : chute
minetest.register_craft({
	output = "deco:chute",
	recipe = {
		{"default:sand"},
		{"default:sign_wall"},
	}
})


--panneau : chute_objet
minetest.register_craft({
	output = "deco:chute_objet",
	recipe = {
		{"default:gravel"},
		{"default:sign_wall"},
	}
})


--panneau : danger
minetest.register_craft({
	output = "deco:danger",
	recipe = {
		{"default:sword_wood"},
		{"default:sign_wall"},
	}
})

--paneau : mine
minetest.register_craft({
	output = "deco:mine",
	recipe = {
		{"default:pickaxe_wood"},
		{"default:sign_wall"},
	}
})

--panneau : mort
minetest.register_craft({
	output = "deco:mort",
	recipe = {
		{"default:glass"},
		{"default:sign_wall"},
	}
})

--block : pierre_bleu
minetest.register_craft({
	output = "deco:pierre_bleu 4",
	recipe = {
		{"dye:blue"},
		{"default:stone"},
	}
})

--pierre grise
minetest.register_craft({
	output = "deco:pierre_grise 4",
	recipe = {
		{"dye:grey"},
		{"default:stone"},
	}
})

--block : pierre_orange
minetest.register_craft({
	output = "deco:pierre_orange 4",
	recipe = {
		{"dye:orange"},
		{"default:stone"},
	}
})

--block : rubik
minetest.register_craft({
	output = "deco:rubik",
	recipe = {
		{"dye:blue","dye:yellow"},
		{"dye:red","dye:green"},
	}
})
--panneau : store
minetest.register_craft({
	output = "deco:store",
	recipe = {
		{"default:chest"},
		{"default:sign_wall"},
	}
})

--block : tv_bas
minetest.register_craft({
	output = "deco:tv_bas",
	recipe = {
		{"","default:coal_lump",""},
		{"","default:glass",""},
		{"","default:stick",""},
	}
})
--block : tv_bas_droite
minetest.register_craft({
	output = "deco:tv_bas_droit",
	recipe = {
		{"default:coal_lump","",""},
		{"","default:glass",""},
		{"","","default:stick"},
	}
})
--block : tv_bas_gauche
minetest.register_craft({
	output = "deco:tv_bas_gauche",
	recipe = {
		{"","","default:coal_lump"},
		{"","default:glass",""},
		{"default:stick","",""},
	}
})
--block : tv_droit
minetest.register_craft({
	output = "deco:tv_droit",
	recipe = {
		{"","",""},
		{"default:coal_lump","default:glass","default:stick"},
		{"","",""},
	}
})
--block : tv_gauche
minetest.register_craft({
	output = "deco:tv_gauche",
	recipe = {
		{"","",""},
		{"default:stick","default:glass","default:coal_lump"},
		{"","",""},
	}
})
--block : tv_haut
minetest.register_craft({
	output = "deco:tv_haut",
	recipe = {
		{"","default:stick",""},
		{"","default:glass",""},
		{"","default:coal_lump",""},
	}
})
--block : tv_haut_droit
minetest.register_craft({
	output = "deco:tv_haut_droit",
	recipe = {
		{"","","default:stick"},
		{"","default:glass",""},
		{"default:coal_lump","",""},
	}
})
--block : tv_haut_gauche
minetest.register_craft({
	output = "deco:tv_haut_gauche",
	recipe = {
		{"default:stick","",""},
		{"","default:glass",""},
		{"","","default:coal_lump"},
	}
})

--block : tv_milieu
minetest.register_craft({
	output = "deco:tv_milieu",
	recipe = {
		{"default:glass","default:glass"},
		{"default:glass","default:glass"},
	}
})

-- +++++++++++++++++++++++++++++++++++
-- |PARAMETRES DES BLOCKS ET PANNEAUX|
-- +++++++++++++++++++++++++++++++++++

--block_zone_danger
minetest.register_node("deco:block_zone_danger", {
	description = "block pour indiquer les zones dangereuses",
	tiles = {"block_zone_danger.png"},
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--chute
minetest.register_node("deco:chute", {
	description = "Panneau attention risque de chute",
	drawtype = "signlike",
	tiles = {"chute.png"},
	inventory_image = "chute.png",
	wield_image = "chute.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

--chute_objet
minetest.register_node("deco:chute_objet", {
	description = "Panneau attention risque de chute objets ou materiaux",
	drawtype = "signlike",
	tiles = {"chute_objet.png"},
	inventory_image = "chute_objet.png",
	wield_image = "chute_objet.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

--danger
minetest.register_node("deco:danger", {
	description = "Panneau pour signaler un danger quelquonque",
	drawtype = "signlike",
	tiles = {"danger.png"},
	inventory_image = "danger.png",
	wield_image = "danger.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

--mine
minetest.register_node("deco:mine", {
	description = "Panneau pour signaler l'entrée d'une mine",
	drawtype = "signlike",
	tiles = {"mine.png"},
	inventory_image = "mine.png",
	wield_image = "mine.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

--mort
minetest.register_node("deco:mort", {
	description = "Panneau pour signaler un danger de mort",
	drawtype = "signlike",
	tiles = {"mort.png"},
	inventory_image = "mort.png",
	wield_image = "mort.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

--pierre_bleu
minetest.register_node("deco:pierre_bleu", {
	description = "Pierre bleu",
	tiles = {"pierre_bleu.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	drop = 'deco:pierre_bleu',
	legacy_mineral = true,
	
})

--pierre_grise
minetest.register_node("deco:pierre_grise", {
	description = "Pierre grise",
	tiles = {"pierre_grise.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	drop = "deco:pierre_grise",
})

--pierre_orange
minetest.register_node("deco:pierre_orange", {
	description = "Pierre orange",
	tiles = {"pierre_orange.png"},
	is_ground_content = false,
	groups = {cracky=3, stone=1},
	drop = 'deco:pierre_orange',
	legacy_mineral = true,
	
})

--rubik
minetest.register_node("deco:rubik", {
	description = "block decoré version rubiks cube",
	tiles = {"rubik.png"},
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})


--store
minetest.register_node("deco:store", {
	description = "Panneau pour signaler un magasin",
	drawtype = "signlike",
	tiles = {"store.png"},
	inventory_image = "store.png",
	wield_image = "store.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = <default>
		--wall_bottom = <default>
		--wall_side = <default>
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	on_construct = function(pos)
		--local n = minetest.env:get_node(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "field[text;;${text}]")
		meta:set_string("infotext", "\"\"")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
		local meta = minetest.env:get_meta(pos)
		fields.text = fields.text or ""
		print((sender:get_player_name() or "").." wrote \""..fields.text..
				"\" to sign at "..minetest.pos_to_string(pos))
		meta:set_string("text", fields.text)
		meta:set_string("infotext", '"'..fields.text..'"')
	end,
})

--tv_bas
minetest.register_node("deco:tv_bas", {
	description = "tv partie basse",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_bas.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_bas_droite
minetest.register_node("deco:tv_bas_droit", {
	description = "tv partie basse droite",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_bas_droit.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_bas_gauche
minetest.register_node("deco:tv_bas_gauche", {
	description = "tv partie basse gauche",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_bas_gauche.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_haut
minetest.register_node("deco:tv_haut", {
	description = "tv partie haute",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_haut.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_gauche
minetest.register_node("deco:tv_gauche", {
	description = "tv partie gauche",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_gauche.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_droite
minetest.register_node("deco:tv_droit", {
	description = "tv partie droite",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_droit.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_haut_droit
minetest.register_node("deco:tv_haut_droit", {
	description = "tv partie haute droite",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_haut_droit.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_haut_gauche
minetest.register_node("deco:tv_haut_gauche", {
	description = "tv partie haute gauche",
	tiles = {"tv_dessus.png","tv_dessous.png","tv_cote.png",
		"tv_cote.png","tv_cote.png","tv_haut_gauche.png"},
	paramtype2 = "facedir",
	legacy_facedir_simple = true,	
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1},
})

--tv_milieu
minetest.register_node("deco:tv_milieu", {
	description = "tv milieu ( pour faire de grand ecran ! )",
	tiles = {"tv_milieu.png"},
	is_ground_content = false,
	groups = {snappy=1, choppy=2, oddly_breakable_by_hand=1},
})




