local usingTorch = false
local torch = nil

RegisterNetEvent('liquid_torch:client:toggleTorch', function()
    useTorch()
end)

function useTorch()
    if usingTorch then
        DetachEntity(torch, true, true)
        DeleteEntity(torch)
        usingTorch = false
        torch = nil
        ClearPedTasks(PlayerPedId())
        print("Torch removed")
    else
        print("Toggling torch...")
        local ped = PlayerPedId()
        local model = Config.Torch.model
        local animDict = "anim@heists@humane_labs@finale@keycards"
        local animName = "ped_a_enter_loop"

        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end

        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end

        TaskPlayAnim(ped, animDict, animName, 2.0, 2.0, -1, 51, 0, false, false, false)

        torch = CreateObjectEntity(model, GetEntityCoords(ped), nil, true, true, false)
        AttachEntityToEntity(torch, ped, GetPedBoneIndex(ped, 18905), 0.14, 0.21, -0.08, -110.0, -1.0, -10.0, true, true, false, true, 1, true)

        usingTorch = true
        RemoveAnimDict(animDict)
        SetModelAsNoLongerNeeded(model)
        CreateThread(function()
            while usingTorch do
                if not IsEntityPlayingAnim(ped, animDict, animName, 3) then
                    TaskPlayAnim(ped, animDict, animName, 2.0, 2.0, -1, 51, 0, false, false, false)
                end
                Wait(2500)
            end
        end)
    end
end

function removeTorch()
    if usingTorch and torch then
        DetachEntity(torch, true, true)
        DeleteEntity(torch)
        usingTorch = false
        ClearPedTasks(PlayerPedId())
        print("Torch removed")
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    if usingTorch then
        removeTorch()
    end
end)