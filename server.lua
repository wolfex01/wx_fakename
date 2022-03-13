ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("newName")
AddEventHandler("newName", function (newName)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setName(newName)
end)

