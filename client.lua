local insideZone = false
local zone

CreateThread(function()
    zone = BoxZone:Create(Config.AdminZone.coords, Config.AdminZone.length, Config.AdminZone.width, {
        name="admin_zone",
        heading=Config.AdminZone.heading,
        minZ=Config.AdminZone.minZ,
        maxZ=Config.AdminZone.maxZ,
        debugPoly=false
    })

    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            insideZone = true
            TriggerServerEvent("rxt:checkAdminAccess")
        else
            insideZone = false
        end
    end)
end)

RegisterNetEvent("rxt:denyAccess", function()
    if insideZone then
        TriggerEvent('chat:addMessage', {
            args = {"^1[Admin Zone]", "^7Access Denied. Only staff can enter this area."}
        })
        SetEntityCoords(PlayerPedId(), Config.TeleportOutCoords.x, Config.TeleportOutCoords.y, Config.TeleportOutCoords.z)
    end
end)
