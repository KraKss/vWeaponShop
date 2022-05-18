ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("KraKss:buyWeaponFromShop")
AddEventHandler("KraKss:buyWeaponFromShop", function(label, name, price, ammo, choosenBlip)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getAccount("money").money
    local xBank = xPlayer.getAccount("bank").money
    local coords = xPlayer.getCoords(true)
    local pedStandingOnPoint = false            
    local dst = #(weaponShop.posBlips[choosenBlip] - coords)

    if dst < weaponShop.dist then    
        pedStandingOnPoint = true     
    else
        pedStandingOnPoint = false
        DropPlayer(_src, "[WeaponShop] Reste dans la zone de vente :)")
        print("[WeaponShop] "..xPlayer.getName(_src).." a essayé d'acheter "..name.." sans être dans la zone de vente")
        return                 
    end
    if weaponShop.itemWeapon then
        if pedStandingOnPoint == true then
            if weaponShop.billingMode == "cash" then
                if xMoney >= price then
                    print("[WeaponShop] "..xPlayer.getName(_src).." a acheté "..name.." pour "..price.."$")
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "Armurerie", "~r~Merci pour votre achat", "CHAR_AMMUNATION", 2)
                    Wait(5000)
                    TriggerClientEvent("esx:showNotification", _src, "Vous avez acheté ~b~"..name.."~s~ pour ~g~"..price.." $")
                    xPlayer.removeAccountMoney("money", price)
                    xPlayer.addInventoryItem(label, ammo)
                else
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Vous n'avez pas assez d'argent", "CHAR_AMMUNATION", 2)
                    return
                end
            elseif weaponShop.billingMode == "bank" then
                if xBank >= price then
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Merci pour votre achat", "CHAR_AMMUNATION", 2)
                    Wait(5000)
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "Banque", "Virement", "Nous avons reçu votre virement de ~g~"..price.." $~s~ pour l'achat de votre ~r~"..name, "CHAR_BANK_FLEECA", 2)
                    xPlayer.removeAccountMoney("bank", price)
                    xPlayer.addInventoryItem(label, ammo)
                else
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Vous n'avez pas assez d'argent sur votre compte en banque", "CHAR_AMMUNATION", 2)
                    return
                end
            end
        end
    else
        if pedStandingOnPoint == true then
            if weaponShop.billingMode == "cash" then
                if xMoney >= price then
                    print("[WeaponShop] "..xPlayer.getName(_src).." a acheté "..name.." pour "..price.."$")
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "Armurerie", "~r~Merci pour votre achat", "CHAR_AMMUNATION", 2)
                    Wait(5000)
                    TriggerClientEvent("esx:showNotification", _src, "Vous avez acheté ~b~"..name.."~s~ pour ~g~"..price.." $")
                    xPlayer.removeAccountMoney("money", price)
                    xPlayer.addWeapon(label, ammo)
                else
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Vous n'avez pas assez d'argent", "CHAR_AMMUNATION", 2)
                    return
                end
            elseif weaponShop.billingMode == "bank" then
                if xBank >= price then
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Merci pour votre achat", "CHAR_AMMUNATION", 2)
                    Wait(5000)
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "Banque", "Virement", "Nous avons reçu votre virement de ~g~"..price.." $~s~ pour l'achat de votre ~r~"..name, "CHAR_BANK_FLEECA", 2)
                    xPlayer.removeAccountMoney("bank", price)
                    xPlayer.addWeapon(label, ammo)
                else
                    TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Vous n'avez pas assez d'argent sur votre compte en banque", "CHAR_AMMUNATION", 2)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent("KraKss:buyItem")
AddEventHandler("KraKss:buyItem", function(label, name, price, ammo, choosenBlip)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getAccount("money").money
    local xBank = xPlayer.getAccount("bank").money
    local coords = xPlayer.getCoords(true)
    local pedStandingOnPoint = false
    local dst = #(weaponShop.posBlips[choosenBlip] - coords)

    if dst < weaponShop.dist then
        pedStandingOnPoint = true
    else
        pedStandingOnPoint = false
        DropPlayer(_src, "[WeaponShop] Reste dans la zone de vente :)")
        print("[WeaponShop] "..xPlayer.getName(_src).." a essayé d'acheter "..name.." sans être dans la zone de vente")
        return
    end
    if pedStandingOnPoint == true then
        if weaponShop.billingMode == "cash" then
            if xMoney >= price then
                print("[WeaponShop] "..xPlayer.getName(_src).." a acheté "..name.." pour "..price.."$")
                TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "Armurerie", "~r~Merci pour votre achat", "CHAR_AMMUNATION", 2)
                Wait(5000)
                TriggerClientEvent("esx:showNotification", _src, "Vous avez acheté ~b~"..name.."~s~ pour ~g~"..price.." $")
                xPlayer.removeAccountMoney("money", price)
                xPlayer.addInventoryItem(label, ammo)
            else
                TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Vous n'avez pas assez d'argent", "CHAR_AMMUNATION", 2)
                return
            end
        elseif weaponShop.billingMode == "bank" then
            if xBank >= price then
                TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Merci pour votre achat", "CHAR_AMMUNATION", 2)
                Wait(5000)
                TriggerClientEvent("esx:showAdvancedNotification", _src, "Banque", "Virement", "Nous avons reçu votre virement de ~g~"..price.." $~s~ pour l'achat de votre ~r~"..name, "CHAR_BANK_FLEECA", 2)
                xPlayer.removeAccountMoney("bank", price)
                xPlayer.addInventoryItem(label, ammo)
            else
                TriggerClientEvent("esx:showAdvancedNotification", _src, "VIBE - DEV", "", "~r~Vous n'avez pas assez d'argent sur votre compte en banque", "CHAR_AMMUNATION", 2)
                return
            end
        end
    end
end)

print("^0[^4WeaponShop^0] Weapon Shop initialized^0")