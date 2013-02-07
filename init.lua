--MOD Deco

--Cree par turbogus

--Graphism and code under gpl2 or later

--plan :
--Liste des blocs
--Déclaration des crafts
--Déclaration des blocs

--Liste des blocs:

--block_zone_danger
--chute
--chute_objet
--danger
--mine
--mort
--pierre_bleu
--pierre_orange
--rubik
--store
--tv_arriere
--tv_bas
--tv_bas_droite
--tv_bas_gauche
--tv_cote
--tv_dessous
--tv_dessus
--tv_droit
--tv_gauche
--tv_haut
--tv_haut_droit
--tv_haut_gauche


--Declaration des crafts

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
		{"default:axe_wood"},
		{"default:sign_wall"},
	}
})

--panneau : mort
default.register_craft({
	output = "deco:mort",
	recipe = {
		{"default:glass"},
		{"default:sign_wall"},
	}
})

--block : pierre_bleu
--block : pierre_orange
--block : rubik
--panneau : store
--block : tv_arriere
--block : tv_bas
--block : tv_bas_droite
--block : tv_bas_gauche
--block : tv_cote
--block : tv_dessous
--block : tv_dessus
--block : tv_droit
--block : tv_gauche
--block : tv_haut
--block : tv_haut_droit
--block : tv_haut_gauche
