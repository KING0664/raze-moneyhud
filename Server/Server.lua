-- # # # # # # # # # # # # # # # # # # # # # # # # # # ## # # # # # # # # # # # # # # # # # #
-- #    ___    _    ____  ___    ___  _____   _____ _    ___  ___ __  __ ___ _  _ _____     #
-- #   | _ \  /_\  |_  / | __|  |   \| __\ \ / / __| |  / _ \| _ \  \/  | __| \| |_   _|    #
-- #   |   / / _ \  / /  | _|   | |) | _| \ V /| _|| |_| (_) |  _/ |\/| | _|| .` | | |      #
-- #   |_|_\/_/ \_\/___| |___|  |___/|___| \_/ |___|____\___/|_| |_|  |_|___|_|\_| |_|      #
-- #                                                                                        #
-- #                                                                                        #
-- #     Discord: https://discord.gg/Xr7MJnxUmk                                             #
-- #     Website: soon                                                                      #
-- #     Tebex: soon                                                                        #
-- #                                                                                        #
-- # # # # # # # # # # # # # # # # # # # # # # # # # # ## # # # # # # # # # # # # # # # # # #

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("Roda_raze-moneyhud:FirstCallBack", function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer then
        cb(xPlayer, xPlayer.getMoney(), xPlayer.getAccount('black_money').money, GetBankMoney(xPlayer) or xPlayer.getBank())
    else
        cb(nil)
    end
end)

function GetBankMoney(xPlayer)
    if xPlayer then
        return xPlayer.getAccount('bank').money
    else
        return 0
    end
end
