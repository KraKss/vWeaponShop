weaponShop = {}
weaponList = {}

weaponShop = {    
    MenuName = {
        Title = "Ammu-Nation",
        Subtitle = "Articles disponibles",
        noLethalTitle = "Armes blanches",
        noLethalSubtitle = "Armes blanches",
        lethalTitle = "Armes à feu",
        lethalSubtitle = "Armes à feu",
        ammoTitle = "Munitions",
        ammoSubtitle = "Munitions",
    },
    Banner = "interaction_bgd",
    noLethalBanner = "interaction_bgd",
    lethalBanner = "interaction_bgd",
    ammoBanner = "interaction_bgd",
    posBlips = {
        vector3(22.0, -1107.2, 28.8),
        vector3(810.2, -2157.3, 28.7),
        vector3(-662.1, -935.3, 20.9), 
        vector3(842.4, -1033.4, 27.2),      
        vector3(2567.6, 294.3, 107.8),
        vector3(252.3, -50.0, 69.0),   
        vector3(-1117.5, 2698.6, 17.6), 
        vector3(1693.4, 3759.5, 33.7),
        vector3(-330.2, 6083.8, 30.5),    -- mettre dans l'ordre         
    },
    posPed = {
        vector4(22.66, -1105.03, 28.8, 167.97),
        vector4(810.3, -2159.4, 28.62, 18.22),
        vector4(2567.9, 292.08, 107.73, 2.85),
        vector4(-662.38, -933.02, 20.83, 182.25),
        vector4(842.46, -1035.51, 27.19, 0.55),
        vector4(254.21, -50.84, 68.94, 67.02),
        vector4(-1119.21, 2700.14, 17.55, 211.45),
        vector4(1691.89, 3761.43, 33.71, 221.66),
        vector4(-331.89, 6085.38, 30.45, 226.15), -- mettre dans l'ordre
    },
    posWeapon = {
        vector3(22.2, -1106.0, 29.79),
        vector3(810.3, -2158.47, 29.61),
        vector3(-662.46, -934.21, 21.82),
        vector3(842.49, -1034.48, 28.19),
        vector3(2568.18, 293.2, 108.73),
        vector3(253.43, -50.31, 69.94),
        vector3(-1118.56, 2699.3, 18.55),
        vector3(1692.62, 3760.49, 34.7),
        vector3(-331.23, 6084.47, 31.45), -- mettre dans l'ordre
    },
    itemWeapon = false, -- true si arme en item, false si non
    ped = "mp_m_weapexp_01",
    dist = 2.0,
    sprite = 110,
    display = 2,
    scale = 0.8,
    color = 75,
    name = "Magasin d'armes",
    billingMode = "cash", --cash or bank
}

weaponList = {    
    type = {
        noLethal = {
            {label = "weapon_knife", name = "Couteau", price = 15000, ammo = 1, damage = 0.40, type = "noLethal", hashKey = "w_me_knife_01"},
            {label = "weapon_knuckle", name = "Poing américain", price = 15000, ammo = 1, damage = 0.40, type = "noLethal", hashKey = "w_me_knuckle"},
            {label = "weapon_bat", name = "Batte de baseball", price = 15000, ammo = 1, damage = 0.40, type = "noLethal", hashKey = "w_me_bat"},
            {label = "weapon_hammer", name = "Marteau", price = 15000, ammo = 1, damage = 0.40, type = "noLethal", hashKey = "w_me_hammer"},
        },
        lethal = {
            {label = "weapon_snspistol", name = "Pétoire", price = 75000, ammo = 1, damage = 0.55, type = "lethal", hashKey = "w_pi_sns_pistol"},
            {label = "weapon_pistol", name = "Pistolet", price = 90000, ammo = 1, damage = 0.66, type = "lethal", hashKey = "w_pi_pistol"},
            {label = "weapon_heavypistol", name = "Pistolet lourd", price = 115000, ammo = 1, damage = 0.75, type = "lethal", hashKey = "w_pi_heavypistol"},
        },
        utils = {            
            {label = "pistol_ammo_box", name = "Boite de .45mm", price = 250, ammo = 1, type = "ammo"},
            {label = "rifle_ammo_box", name = "Boite de 5.56mm", price = 500, ammo = 1, type = "ammo"},
            {label = "smg_ammo_box", name = "Boite 9mm", price = 350, ammo = 1, type = "ammo"},
        },
    },
}