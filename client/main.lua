--BU Yardim menusu ZexHA tarafından kodlanmıştır.
--BU Yardim menusu ZexHA tarafından kodlanmıştır.
--BU Yardim menusu ZexHA tarafından kodlanmıştır.

ESX = nil
inMenu = true

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Await(0)
    end
end)


Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if IsControlJustReleased(1, 57) then
        inMenu = true
        openUI(true)
        SetNuiFocus(true, true)
        print(inMenu)
    end
end
end)

function openUI(enable)
    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end
RegisterCommand("Yardimfix", function()
    openUI(false)
    SetNuiFocus(false, false)
end, false)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if IsControlJustReleased(1, 177) then
        if  ismenu then 
        openUI(false)
        SetNuiFocus(false, false)
        end
    end
end
end)

    RegisterNUICallback('escape', function(data, cb)
        openUI(false)
        SetNuiFocus(false, false)
        cb('ok')
    end)
    RegisterNUICallback('login', function(data, cb)
        PrintChatMessage(data.username .. " - " .. data.password)
    
        cb('ok')
    end)