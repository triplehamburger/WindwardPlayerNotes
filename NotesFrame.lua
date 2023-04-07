local addonName, addonTable = ...
local addonVersion = "1.0"
local addonAuthor = "Alex Rajasekaran, Matt "
local addonDescription = "A WoW addon that stores notes about players"

-- Hash Table
local playerNotesDB = {}
WindwardPlayerNotesDB = WindwardPlayerNotesDB or {}
WindwardPlayerNotesDB.playerNotes = playerNotesDB

-- Load the XML-defined GUI elements
local MyFrame = CreateFrame("Frame", "MyFrame", UIParent)
MyFrame:SetSize(200, 100)
MyFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
MyFrame:SetMovable(true)
MyFrame:SetScript("OnMouseDown", function(self, button)
      if button == "RightButton" then
         self:StartMoving()
      end
end)
MyFrame:SetScript("OnMouseUp", function(self, button)
      self:StopMovingOrSizing()
end)

--  String to hold note
local MyEditBox = CreateFrame("EditBox", "MyEditBox", MyFrame)
MyEditBox:SetSize(180, 20)
MyEditBox:SetPoint("BOTTOM", MyFrame, "TOP", 0, -20)
MyEditBox:SetFontObject("GameFontNormal")
MyEditBox:SetMultiLine(true)
MyEditBox:SetJustifyH("CENTER")
MyEditBox:SetText("Type note here!")
MyEditBox:SetScript("OnEnterPressed", function(self, key)
      if key == "ENTER" then
         self:Hide()
      end
end)

-- Submit Button
local MyButton = CreateFrame("Button", "MyButton", MyFrame, "UIPanelButtonTemplate")
MyButton:SetSize(100, 30)
MyButton:SetPoint("CENTER", MyFrame, "CENTER", 0, 0)
MyButton:SetText("Submit")
MyButton:SetScript("OnClick", function()
      local input = MyEditBox:GetText()
      local targetGUID = UnitGUID("target")
      local playerNotes = input
      WindwardPlayerNotesDB.playerNotes[targetGUID] = playerNotes
      MyFrame:Hide()
end)

-- Notes Button
local notesButton = CreateFrame("Button", "NotesButton", UIParent, "UIPanelButtonTemplate")
notesButton:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
notesButton:SetSize(100, 30)
notesButton:SetText("Notes")
notesButton:SetScript("OnClick", function()
      MyFrame:Show()
end)

MyFrame:Hide()