if Config.Framework ~= "qb" then
    return
end

local QBCore = exports['qb-core']:GetCoreObject()

function RegisterUseableItem(name, cb)
    QBCore.Functions.CreateUseableItem(name, cb)
end