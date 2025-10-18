if Config.Framework ~= "esx" then
    return
end

local ESX = exports['es_extended']:getSharedObject()

function RegisterUseableItem(name, cb)
    ESX.RegisterUsableItem(name, cb)
end