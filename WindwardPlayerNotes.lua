local addonName, addonTable = ...
local addonVersion = "1.0"
local addonAuthor = "Alex Rajasekaran, Matt "
local addonDescription = "A WoW addon that stores notes about players"
local playerNotesDB = {}
WindwardPlayerNotesDB = WindwardPlayerNotesDB or {}
WindwardPlayerNotesDB.playerNotes = playerNotesDB

local notesButton = CreateFrame("Button", "NotesButton", UIParent, "UIPanelButtonTemplate")
notesButton:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
notesButton:SetSize(100, 30)
notesButton:SetText("Notes")
notesButton:SetScript("OnClick", function()
  <Frame name="MyFrame" parent="UIParent" movable="true" width="200" height="100">
  <EditBox name="MyEditBox" parent="$parent" fontObject="GameFontNormal" multiLine="false" width="180" height="20" 
  justifyH="CENTER" text="Enter a string" />
  <Button name="MyButton" parent="$parent" fontObject="GameFontNormal" width="60" height="20" text="Submit">
    <Scripts>
      <OnClick>
        local input = MyEditBox:GetText()
        local targetGUID = UnitGUID("target")
        local playerNotes = input
        WindwardPlayerNotesDB.playerNotes[targetGUID] = playerNotes
      </OnClick>
    </Scripts>
  </Button>
</Frame>
end)