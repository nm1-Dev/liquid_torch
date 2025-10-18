if Config.Framework == "qb" then
    local QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Functions.CreateUseableItem(Config.Torch.Item, function(source, item)
        TriggerClientEvent('liquid_torch:client:toggleTorch', source)
    end)
elseif Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()

    ESX.RegisterUsableItem(Config.Torch.Item, function(source)
        TriggerClientEvent('liquid_torch:client:toggleTorch', source)
    end)
end