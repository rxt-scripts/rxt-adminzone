RegisterServerEvent("rxt:checkAdminAccess")
AddEventHandler("rxt:checkAdminAccess", function()
    local src = source

    -- ACE permission check
    if IsPlayerAceAllowed(src, Config.AcePermission) then return end

    -- Discord whitelist (optional)
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if string.find(id, "discord:") then
            for _, allowed in ipairs(Config.DiscordWhitelist) do
                if id == allowed then return end
            end
        end
    end

    -- Deny access
    TriggerClientEvent("rxt:denyAccess", src)
end)
