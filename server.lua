ESX = nil

-- eseménykezelő az ESX objektum lekéréséhez
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- eseménykezelő a "newName" szerveroldali eseményhez
AddEventHandler('newName', function(newName)
    -- lekérjük a játékost az azonosító alapján
    local xPlayer = ESX.GetPlayerFromId(source)

    -- beállítjuk az új nevet
    xPlayer.setName(newName)
end)
