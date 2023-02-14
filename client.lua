ESX = nil
local isUIOpen = false
local fakeName = nil

-- a funkció, amely inicializálja az ESX objektumot
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

-- a funkció, amely megnyitja/zárja a felugró ablakot
local toggleUI = function(show)
    isUIOpen = show
    SendNUIMessage({
        type = show and 'open' or 'close'
    })
    SetNuiFocus(show, show)
end

-- parancskezelő, amely aktiválja a fake name megjelenítését
RegisterCommand('fakename', function()
    toggleUI(not isUIOpen)
end)

-- a callback, amely lezárja a felugró ablakot
RegisterNUICallback('closePanel', function()
    toggleUI(false)
end)

-- a callback, amely beállítja a fake nevet a szerveren
RegisterNUICallback('adat', function(data)
    fakeName = data.name
    TriggerServerEvent('newName', fakeName)
    toggleUI(false)
end)
