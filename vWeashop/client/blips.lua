allBlips = {}

CreateThread(function()
	for i = 1, #weaponShop.posBlips do
        local blips = AddBlipForCoord(weaponShop.posBlips[i])
        table.insert(allBlips, blips)
        SetBlipSprite (blips, weaponShop.sprite)
        SetBlipDisplay(blips, weaponShop.display)
        SetBlipScale  (blips, weaponShop.scale)
        SetBlipColour (blips, weaponShop.color)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("string")     
        AddTextComponentString(weaponShop.name)  
        EndTextCommandSetBlipName(blips)
	end
end)

Citizen.CreateThread(function()
    for i = 1, #weaponShop.posPed do
        RequestModel(weaponShop.ped)    
        while not HasModelLoaded(weaponShop.ped) do
            Citizen.Wait(100)
        end    
        local pedCreated = CreatePed(0, weaponShop.ped, weaponShop.posPed[i], false, false) 
        SetBlockingOfNonTemporaryEvents(pedCreated, true)
        SetEntityInvincible(pedCreated, true)
        FreezeEntityPosition(pedCreated, true)
    end
end) 

Citizen.CreateThread(function()
    while true do
    local wait = 1000        
        for k,v in pairs(weaponShop.posBlips) do       
            local co = GetEntityCoords(PlayerPedId())
            local dist = Vdist(co.x, co.y, co.z, v.x, v.y, v.z)            
            if dist <= weaponShop.dist then  
                choosenBlip = nil               
                wait = 0
                choosenBlip = k             
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour parler au vendeur", true, true, 1)               
                DrawMarker(23, v.x, v.y, v.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 200, false, false, 2, nil, nil, false)  
                if IsControlJustPressed(1, 51) then                                                   
                    weaMenu()                                                                                                                                        
                end            
            end                                 
        end                     
    Citizen.Wait(wait)
    end
end) 