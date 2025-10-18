---------------------------------------
-- Create Object Entity (networked and non netowrked)
---------------------------------------
function CreateObjectEntity(modelName, coords, rot, isDynamic, isNetworked, freeze, duration)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    -- Create object safely (use default true for networking unless explicitly false)
    local object = CreateObject(model, coords.x, coords.y, coords.z, isNetworked ~= false, false, isDynamic or false)

    -- Optional rotation
    if rot then
        SetEntityRotation(object, rot.x or 0.0, rot.y or 0.0, rot.z or 0.0, 2, true)
    end

    -- Optional freeze
    if freeze then FreezeEntityPosition(object, true) end

    -------------------------------------------------------
    -- 🔗 Network Sync Handling
    -------------------------------------------------------
    if isNetworked ~= false then
        -- Register object on network
        if not NetworkGetEntityIsNetworked(object) then
            NetworkRegisterEntityAsNetworked(object)
        end

        -- Wait until entity has a valid Net ID
        local netId = NetworkGetNetworkIdFromEntity(object)
        local timer = GetGameTimer()
        while not NetworkDoesEntityExistWithNetworkId(netId) and GetGameTimer() - timer < 2000 do
            Wait(10)
            netId = NetworkGetNetworkIdFromEntity(object)
        end

        -- Allow migration & replication
        SetNetworkIdCanMigrate(netId, true)
        SetNetworkIdExistsOnAllMachines(netId, true)

        -- Request control
        if not NetworkHasControlOfEntity(object) then
            NetworkRequestControlOfEntity(object)
            local controlTimer = GetGameTimer()
            while not NetworkHasControlOfEntity(object) and GetGameTimer() - controlTimer < 1500 do
                Wait(10)
                NetworkRequestControlOfEntity(object)
            end
        end
    end

    -------------------------------------------------------
    -- 🧹 Optional timed deletion
    -------------------------------------------------------
    if duration and duration > 0 then
        CreateThread(function()
            Wait(duration)
            if DoesEntityExist(object) then DeleteEntity(object) end
        end)
    end

    SetModelAsNoLongerNeeded(model)
    return object
end