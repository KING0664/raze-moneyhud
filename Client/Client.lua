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
Loaded = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Wait(100)
    end

    Loaded = true

    ESX.TriggerServerCallback("Roda_raze-moneyhud:FirstCallBack", function(xPlayer, money, dirtymoney, bankmoney)
        SendNUIMessage({
            action = "UpdateData",
            key = "bankmoney",
            value = tonumber(bankmoney)
        })

        SendNUIMessage({
            action = "UpdateData",
            key = "dirtymoney",
            value = tonumber(dirtymoney)
        })

        SendNUIMessage({
            action = "UpdateData",
            key = "job",
            value = xPlayer.job.label,
            key2 = "grado",
            value2 = xPlayer.job.grade_label
        })

        SendNUIMessage({
            action = "UpdateData",
            key = "money",
            value = tonumber(money)
        })

        TriggerEvent('es:setMoneyDisplay', 0.0)
        ESX.UI.HUD.SetDisplay(0.0)
    end)
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == "bank" then
        SendNUIMessage({
            action = "UpdateData",
            key = "bankmoney",
            value = tonumber(account.money)
        })
    elseif account.name == "black_money" then
        SendNUIMessage({
            action = "UpdateData",
            key = "dirtymoney",
            value = tonumber(account.money)
        })
    elseif account.name == "money" then
        SendNUIMessage({
            action = "UpdateData",
            key = "money",
            value = tonumber(account.money)
        })
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    SendNUIMessage({
        action = "UpdateData",
        key = "job",
        key2 = "grado",
        value = job.label,
        value2 = job.grade_label
    })
end)

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(e)
    SendNUIMessage({
        action = "UpdateData",
        key = "money",
        value = tonumber(e)
    })
end)
