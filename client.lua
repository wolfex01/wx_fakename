ESX = nil
Show = false
local fakeName = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


local Show = function ()
    Show = not Show
    if (not Show) then
        SendNUIMessage({
            type = 'close'
        })
        SetNuiFocus(false,false)
    elseif (Show) then
        SendNUIMessage({
            type = 'open'
        })
        SetNuiFocus(true,true)
    end
end

RegisterCommand('fakename', function()
    Show()
end)

RegisterNUICallback('closePanel', function() 
    Show()
end)

RegisterNUICallback("adat", function(data) 
    fakeName = data.name
    TriggerServerEvent("newName", fakeName)
    Show()
end)