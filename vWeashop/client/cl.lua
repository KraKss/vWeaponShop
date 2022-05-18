  _  __         _  __       
 | |/ /_ _ __ _| |/ / ______
 | ' <| '_/ _` | ' < (_-<_-<
 |_|\_\_| \__,_|_|\_\/__/__/
                            

local weaOpen = false
local unFreezed = false
local propsHeading = 0
local hash, weaponObject
local listNoLethal, listLethal = {}, {}

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mainMenu = RageUI.CreateMenu(weaponShop.MenuName.Title, weaponShop.MenuName.Subtitle, nil, nil, "commonmenu", weaponShop.Banner)
local noLethalMenu = RageUI.CreateSubMenu(mainMenu, weaponShop.MenuName.noLethalTitle, weaponShop.MenuName.noLethalSubtitle, nil, nil, "commonmenu", weaponShop.noLethalBanner)
local lethalMenu = RageUI.CreateSubMenu(mainMenu, weaponShop.MenuName.lethalTitle, weaponShop.MenuName.lethalSubtitle, nil, nil, "commonmenu", weaponShop.lethalBanner)
local ammoMenu = RageUI.CreateSubMenu(mainMenu, weaponShop.MenuName.ammoTitle, weaponShop.MenuName.ammoSubtitle, nil, nil, "commonmenu", weaponShop.ammoBanner)
mainMenu.Closed = function() weaOpen = false end
mainMenu:DisplayPageCounter(true)
mainMenu.Display.Glare = false
mainMenu.EnableMouse = false

function weaMenu()
	weaOpen = false
    if weaOpen then 
        weaOpen = false         
            RageUI.Visible(mainMenu, false)            
        return 
    else 
        weaOpen = true         
        RageUI.Visible(mainMenu, true)	
        Citizen.CreateThread(function()                        
            while weaOpen do
                DisableControlAction(1, 51, true)
                if RageUI.CurrentMenu == mainMenu then
                    DeleteObject(weaponObject)
                    hash = nil                    
                    if IsControlJustPressed(1, 177) then
                        unFreezed = true
                    end
                end
                FreezeEntityPosition(PlayerPedId(), true)		
                RageUI.IsVisible(mainMenu, function()											
                    RageUI.Button("Armes Blanches", "Voir toutes les armes blanches disponibles", {RightLabel = "→"}, true, {
                        onSelected = function()

                        end}, noLethalMenu)

                        RageUI.Button("Armes à feu", "Voir toutes les armes à feu disponibles", {RightLabel = "→"}, true, {
                        onSelected = function()

                        end}, lethalMenu)

                        RageUI.Line()

                        RageUI.Button("Munitions", "Voir toutes les boites de munitions disponibles", {RightLabel = "→"}, true, {
                        onSelected = function()

                        end}, ammoMenu)
                    end)

                RageUI.IsVisible(noLethalMenu, function()
                    for i = 1, #weaponList.type.noLethal, 1 do
                        --if weaponList.type.noLethal[i].name ~= "WEAPON_UNARMED" then
                            --print(weaponList.type.noLethal[i].name)
                        --end
                        if listNoLethal[i] == nil then
                            listNoLethal[i] = 1
                        end
                        RageUI.List(weaponList.type.noLethal[i].name, {"Preview","Acheter"}, listNoLethal[i], nil, {RightLabel = weaponList.type.noLethal[i].price.."~g~ $"}, true, {
                            onListChange = function(IndexList)
                                listNoLethal[i] = IndexList
                            end,
                            onSelected = function(index)
                                if index == 1 then
                                    DeleteObject(weaponObject)
                                    weaponObject = nil
                                    hash = GetHashKey(weaponList.type.noLethal[i].hashKey)
                                    RequestModel(hash)
                                    Citizen.CreateThread(function()
                                        local waiting = 0
                                        while not HasModelLoaded(hash) do
                                            waiting = waiting + 100
                                            Citizen.Wait(100)
                                            if waiting > 5000 then
                                                break
                                            end
                                        end
                                        for k,v in pairs(weaponShop.posWeapon) do
                                            if k == choosenBlip then
                                                weaponObject = CreateObject(hash, v, true, false, false)
                                            end
                                        end
                                        Citizen.CreateThread(function()
                                            while true do
                                                if weaOpen then
                                                    SetEntityHeading(weaponObject, propsHeading)
                                                    propsHeading = propsHeading + 0.2
                                                else
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end)
                                    end)
                                elseif index == 2 then
                                    TriggerServerEvent("KraKss:buyWeaponFromShop", weaponList.type.noLethal[i].label, weaponList.type.noLethal[i].name, weaponList.type.noLethal[i].price, weaponList.type.noLethal[i].ammo, choosenBlip)
                                end
                            end
                        })
                    end
                    for i,d in pairs(weaponList.type.noLethal) do
                        RageUI.StatisticPanelAdvanced("Degâts de l'arme", 0, nil, d.damage, {255, 255, 255, 255}, nil, i)
                    end
                end)
                RageUI.IsVisible(lethalMenu, function()                 
                    for i = 1, #weaponList.type.lethal, 1 do
                        --if weaponList.type.noLethal[i].name ~= "WEAPON_UNARMED" then
                        --    --print(weaponList.type.noLethal[i].name)
                        --end
                        if listLethal[i] == nil then
                            listLethal[i] = 1
                        end
                        RageUI.List(weaponList.type.lethal[i].name, {"Preview","Acheter"}, listLethal[i], nil, {RightLabel = weaponList.type.lethal[i].price.."~g~ $"}, true, {
                            onListChange = function(IndexList)
                                listLethal[i] = IndexList
                            end,
                            onSelected = function(index)
                                if index == 1 then
                                    DeleteObject(weaponObject)
                                    weaponObject = nil
                                    hash = GetHashKey(weaponList.type.lethal[i].hashKey)
                                    RequestModel(hash)
                                    Citizen.CreateThread(function()
                                        local waiting = 0
                                        while not HasModelLoaded(hash) do
                                            waiting = waiting + 100
                                            Citizen.Wait(100)
                                            if waiting > 5000 then
                                                break
                                            end
                                        end
                                        for k,v in pairs(weaponShop.posWeapon) do
                                            if k == choosenBlip then 
                                                weaponObject = CreateObject(hash, v, true, false, false)
                                            end                          
                                        end        
                                        Citizen.CreateThread(function()
                                            while true do
                                                if weaOpen then
                                                    SetEntityHeading(weaponObject, propsHeading)
                                                    propsHeading = propsHeading + 0.07
                                                else
                                                    break
                                                end
                                                Citizen.Wait(0)
                                            end
                                        end)                                
                                    end)
                                elseif index == 2 then
                                    TriggerServerEvent("KraKss:buyWeaponFromShop", weaponList.type.lethal[i].label, weaponList.type.lethal[i].name, weaponList.type.lethal[i].price, weaponList.type.lethal[i].ammo, choosenBlip)
                                end
                            end
                        })
                    end
                    for i,d in pairs(weaponList.type.lethal) do
                        RageUI.StatisticPanelAdvanced("Degâts de l'arme", 0, nil, d.damage, {255, 255, 255, 255}, nil, i)
                    end
                end)
                RageUI.IsVisible(ammoMenu, function()
                    for _, v in pairs(weaponList.type.utils) do
                        RageUI.Button(v.name, v.desc, {RightLabel = v.price.."~g~ $"}, true, {
                            onSelected = function()
                                if weaponShop.itemWeapon then
                                    TriggerServerEvent("KraKss:buyWeaponFromShop", v.label, v.name, v.price, v.ammo, choosenBlip)
                                else
                                    TriggerServerEvent("KraKss:buyItem", v.label, v.name, v.price, v.ammo, choosenBlip)
                                end
                            end})
                    end
                end)
                Citizen.Wait(0)
            end
        end)
    end
end   

Citizen.CreateThread(function()
    while true do
        if unFreezed then 
            FreezeEntityPosition(PlayerPedId(), false)
            DisableControlAction(1, 51, false)
        end
        Citizen.Wait(500)
    end
end)
