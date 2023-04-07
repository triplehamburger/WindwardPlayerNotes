-- Save the player notes to the SavedVariables file
local function SavePlayerNotes()
    WindwardPlayerNotesDB = WindwardPlayerNotesDB or {}
    WindwardPlayerNotesDB.playerNotes = playerNotesDB
 end
 
 -- Register an event handler for when the addon is loaded
 local function OnAddonLoaded(event, addonName)
    if addonName == "MyAddon" then
       playerNotesDB = WindwardPlayerNotesDB and WindwardPlayerNotesDB.playerNotes or {}
       SavePlayerNotes()
    end
 end
 
 -- Register an event handler for when the player logs out or the game is closed
 local function OnPlayerLogout(event)
    SavePlayerNotes()
 end
 
 -- Register the event handlers
 local frame = CreateFrame("Frame")
 frame:RegisterEvent("ADDON_LOADED")
 frame:RegisterEvent("PLAYER_LOGOUT")
 frame:SetScript("OnEvent", function(self, event, ...)
       if event == "ADDON_LOADED" then
          OnAddonLoaded(...)
       elseif event == "PLAYER_LOGOUT" then
          OnPlayerLogout(...)
       end
 end)