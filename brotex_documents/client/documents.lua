ESX = exports["es_extended"]:getSharedObject()


-- Commands 
for i = 1, #Brotex.MenuOpenCommands do
  RegisterCommand(Brotex.MenuOpenCommands[i], function(source, args, rawCommand)
    lib.showContext('documents_menu')
  end)
end

-- Keybindsg
if Brotex.MenuKeybind ~= '' then
  if #Brotex.MenuOpenCommands > 0 then
      RegisterKeyMapping(Brotex.MenuOpenCommands[1], 'Documents', 'keyboard', Brotex.MenuKeybind)
  end
end


-- LOOK AT YOUR OWN ID-CARD 
RegisterNetEvent("look:card", function()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
end)

-- SHOW YOUR ID-CARD TO THE CLOSEST PERSON 
RegisterNetEvent("show:card", function()
  local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
  else
    lib.notify({
      title = 'No players nearby',
      type = 'error', 
      position = 'top-center', 
    })
  end
end)

-- LOOK AT YOUR OWN DRIVER LICENSE
RegisterNetEvent("look:driver", function()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
end)


-- SHOW YOUR DRIVER LICENSE TO THE CLOSEST PERSON 
RegisterNetEvent("show:driver", function()
  local player, distance = ESX.Game.GetClosestPlayer()
  if distance ~= -1 and distance <= 3.0 then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
  else
    lib.notify({
      title = 'No players nearby',
      type = 'error', 
      position = 'top-center', 
    })
  end
end)  


-- LOOK AT YOUR OWN FIREARMS LICENSE  
RegisterNetEvent("look:firearms", function()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
end)  

-- SHOW YOUR FIREARMS LICENSE TO THE CLOSEST PERSON 
RegisterNetEvent("show:firearms", function()
  local player, distance = ESX.Game.GetClosestPlayer()

  if distance ~= -1 and distance <= 3.0 then
    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
  else
    lib.notify({
      title = 'No players nearby',
      type = 'error', 
      position = 'top-center', 
    })
  end
end)  



lib.registerContext({
  id = 'documents_menu',
  title = 'Documents',
  options = {
    {
      title = 'ID CARD',
      description = 'look at your own id-card',
      icon = 'id-card',
      event = 'look:card',
    },

    {
      title = 'ID CARD',
      description = 'show your id-card to the closest person',
      icon = 'id-card',
      event = 'show:card',
    },

    {
      title = 'DRIVER LICENSE',
      description = 'look at your own driver license',
      icon = 'car',
      event = 'look:driver',
    },

    {
      title = 'DRIVER LICENSE',
      description = 'show your driver license to the closest person',
      icon = 'car',
      event = 'show:driver',
    },
 
    {
      title = 'FIREARMS LICENSE',
      description = 'look at your own firearms license',
      icon = 'gun',
      event = 'look:firearms',
    },

    {
      title = 'FIREARMS LICENSE',
      description = 'show your firearms license to the closest person',
      icon = 'gun',
      event = 'show:firearms',
    },
   
    
  }
})







