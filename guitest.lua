--[[
    SkyHub Mobile-Friendly Script with LinoriaLib
    Created by: xAI (Grok 3)
    Date: March 31, 2025
]]

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

-- ปรับหน้าต่างให้เหมาะกับมือถือ
local Window = Library:CreateWindow({
    Title = 'SkyHub Mobile',
    Center = false, -- ไม่ใช้ Center เพื่อกำหนดตำแหน่งเอง
    AutoShow = true,
    Size = UDim2.new(0, 300, 0, 400), -- ขนาดเล็กลงสำหรับมือถือ (กว้าง 300, สูง 400)
    Position = UDim2.new(0, 10, 0, 10), -- วางมุมบนซ้าย (ห่างขอบ 10 พิกเซล)
})

-- Tabs
local Tabs = {
    Main = Window:AddTab('หลัก'),
    Settings = Window:AddTab('การตั้งค่า'),
}

-- Groupbox สำหรับแท็บหลัก
local MainGroup = Tabs.Main:AddLeftGroupbox('ฟีเจอร์หลัก')

-- Toggle ขนาดใหญ่ขึ้นสำหรับสัมผัส
MainGroup:AddToggle('MobileToggle', {
    Text = 'เปิดใช้งานฟีเจอร์',
    Default = true,
    Tooltip = 'เปิด/ปิดฟีเจอร์หลัก'
})

Toggles.MobileToggle:OnChanged(function()
    print('ฟีเจอร์เปลี่ยนเป็น:', Toggles.MobileToggle.Value)
end)

-- ปุ่มใหญ่ขึ้นสำหรับมือถือ
local FeatureButton = MainGroup:AddButton('เรียกใช้งาน', function()
    print('คุณแตะปุ่มเรียกใช้งาน!')
end)
FeatureButton:AddTooltip('แตะเพื่อเรียกฟีเจอร์')

-- ปุ่มย่อย
local SubButton = FeatureButton:AddButton('รีเซ็ต', function()
    print('คุณแตะปุ่มรีเซ็ต!')
end)
SubButton:AddTooltip('รีเซ็ตการตั้งค่า')

-- Label และ Divider
MainGroup:AddLabel('สถานะ: พร้อมใช้งาน')
MainGroup:AddDivider()

-- Slider ปรับให้เหมาะกับการสัมผัส
MainGroup:AddSlider('MobileSlider', {
    Text = 'ระดับพลัง',
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Compact = false,
})

Options.MobileSlider:OnChanged(function()
    print('ระดับพลังเปลี่ยนเป็น:', Options.MobileSlider.Value)
end)

-- Dropdown ขนาดใหญ่ขึ้น
MainGroup:AddDropdown('MobileDropdown', {
    Values = { 'โหมด 1', 'โหมด 2', 'โหมด 3' },
    Default = 1,
    Multi = false,
    Text = 'เลือกโหมด',
    Tooltip = 'เลือกโหมดการทำงาน'
})

Options.MobileDropdown:OnChanged(function()
    print('โหมดเปลี่ยนเป็น:', Options.MobileDropdown.Value)
end)

-- Settings Tab
local SettingsGroup = Tabs.Settings:AddLeftGroupbox('การตั้งค่า')

SettingsGroup:AddButton('ปิดเมนู', function()
    Library:Unload()
end)

SettingsGroup:AddLabel('คีย์บินด์เมนู'):AddKeyPicker('MenuKeybind', {
    Default = 'End',
    NoUI = true,
    Text = 'เปิด/ปิดเมนู'
})

-- ปรับแต่ง Library
Library.ToggleKeybind = Options.MenuKeybind
Library:SetWatermark('SkyHub Mobile | Optimized')
Library:SetWatermarkVisibility(true)

Library:OnUnload(function()
    print('เมนูถูกปิด!')
    Library.Unloaded = true
end)

-- Theme และ Save Manager
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({'MenuKeybind'})
ThemeManager:SetFolder('SkyHubMobile')
SaveManager:SetFolder('SkyHubMobile/config')
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

-- โหลดการกำหนดค่าอัตโนมัติ
SaveManager:LoadAutoloadConfig()
