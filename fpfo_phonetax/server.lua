if Config.Framework == "esx" then 
    ESX = exports["es_extended"]:getSharedObject() 
else 
    QBCore = exports["qb-core"]:GetCoreObject() 
end

Citizen.CreateThread(function()
    while true do
        for k, playerid in pairs(GetPlayers()) do
            local xPlayer
            if Config.Framework == "esx" then
                xPlayer = ESX.GetPlayerFromId(playerid)
            else
                xPlayer = QBCore.Functions.GetPlayer(playerid)
            end

            if xPlayer then
                local phoneItem
                if Config.Framework == "esx" then
                    phoneItem = xPlayer.getInventoryItem(Config.Phoneitem)
                else
                    phoneItem = xPlayer.Functions.GetItemByName(Config.Phoneitem)
                end

                if phoneItem and phoneItem.count > 0 then
                    local price = Config.Price
                    if Config.Framework == "esx" then
                        xPlayer.removeAccountMoney('bank', price)
                    else
                        xPlayer.Functions.RemoveMoney('bank', price)
                    end

                    if Config.Locale == 'de' then
                        TriggerClientEvent('phonetax:msg', xPlayer.source, Config.NotificationPicture, "Du hast ~g~$50~w~ für deinen Handyvertrag bezahlt", "Handyvertrag", "Gebühren bezahlt")
                    else
                        TriggerClientEvent('phonetax:msg', xPlayer.source, Config.NotificationPicture, "You paid ~g~$50~w~ for your phone contract", "Phone contract", "Fees paid")
                    end
                end
            end
        end
        Citizen.Wait(Config.Time)
    end
end)