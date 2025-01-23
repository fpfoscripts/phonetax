if Config.Framework == "esx" then 
    ESX = exports["es_extended"]:getSharedObject() 
else 
    QBCore = exports["qb-core"]:GetCoreObject() 
end

RegisterNetEvent('phonetax:msg')
AddEventHandler('phonetax:msg', function(icon, msg, title, subtitle)
    showPictureNotification(icon, msg, title, subtitle)
end)

function showPictureNotification(icon, msg, title, subtitle)
    if Config.Framework == "esx" then
        SetNotificationTextEntry("STRING")
        AddTextComponentString(msg)
        SetNotificationMessage(icon, icon, true, 1, title, subtitle)
        DrawNotification(false, true)
    else
        QBCore.Functions.Notify(msg, "primary", 5000)
    end
end