--Made by Manmadedrummer for Araxia Server

local BLACK_MARKET_NPC_ID = 101111 -- Replace with your NPC's ID
local ARAXIA_TOKEN_ID = 910001 -- ID of Araxia Tokens
local SET_COST = 100 -- Cost of each armor set in Araxia Tokens
local UPDATE_INTERVAL = 604800 -- 1 week in seconds

-- Class names and icons for the menu
local CLASS_NAMES_AND_ICONS = {
    [11] = {name = "Druid", icon = "Interface\\icons\\classicon_druid"},
    [3] = {name = "Hunter", icon = "Interface\\icons\\ability_impalingbolt"},
    [8] = {name = "Mage", icon = "Interface\\icons\\classicon_mage"},
    [2] = {name = "Paladin", icon = "Interface\\icons\\classicon_paladin"},
    [5] = {name = "Priest", icon = "Interface\\icons\\classicon_priest"},
    [4] = {name = "Rogue", icon = "Interface\\icons\\ability_rogue_deadlybrew"},
    [7] = {name = "Shaman", icon = "Interface\\icons\\classicon_shaman"},
    [9] = {name = "Warlock", icon = "Interface\\icons\\spell_shadow_possession"},
    [1] = {name = "Warrior", icon = "Interface\\icons\\classicon_warrior"},
    [6] = {name = "Death Knight", icon = "Interface\\icons\\spell_deathknight_classicon"}
}

local selectedSets = {}

-- Function to update the selectedSets table with random sets weekly
local function UpdateBlackMarketSets()
    selectedSets = {}
    local query = WorldDBQuery("SELECT class, item_set_id, set_name FROM black_market_current_set")
    if query then
        repeat
            local class = query:GetInt32(0)
            local item_set_id = query:GetInt32(1)
            local set_name = query:GetString(2)
            selectedSets[class] = { item_set_id = item_set_id, set_name = set_name }
        until not query:NextRow()
    end
end

UpdateBlackMarketSets()

-- Function to handle the NPC's gossip menu
local function BlackMarket_OnGossipHello(event, player, creature)
    player:GossipClearMenu()
    for classId, classData in pairs(CLASS_NAMES_AND_ICONS) do
        local icon = "|T" .. classData.icon .. ":25|t"
        player:GossipMenuAddItem(0, icon .. " View " .. classData.name .. " armor set", 0, classId)
    end
    player:GossipSendMenu(1, creature)
end

-- Function to display the available sets to the player
local function ShowAvailableSets(player, creature, classId)
    local selectedSet = selectedSets[classId]
    if selectedSet then
        local set_name = selectedSet.set_name
        local item_set_id = selectedSet.item_set_id
        
        player:GossipClearMenu()
        player:GossipMenuAddItem(0, set_name .. " (100 Araxia Tokens)", 0, 1000 + item_set_id)
        player:GossipMenuAddItem(0, "Back", 0, 999) -- Add an option to go back to the class menu
        player:GossipSendMenu(1, creature)
    else
        player:SendNotification("No set available for this class.")
        BlackMarket_OnGossipHello(event, player, creature)
    end
end

-- Function to handle the purchase of an item set
local function BlackMarket_OnGossipSelectOption(event, player, creature, sender, item_set_id, code)
    local token_count = player:GetItemCount(ARAXIA_TOKEN_ID)
    if token_count >= SET_COST then
        local items_query = WorldDBQuery("SELECT item_id FROM black_market_armor_sets WHERE item_set_id = " .. item_set_id)
        if items_query then
            repeat
                local item_id = items_query:GetInt32(0)
                player:AddItem(item_id, 1)
            until not items_query:NextRow()
        end
        player:RemoveItem(ARAXIA_TOKEN_ID, SET_COST)
        player:SendNotification("You have purchased the armor set for " .. SET_COST .. " Araxia Tokens.")
    else
        player:SendNotification("You do not have enough Araxia Tokens.")
    end
    player:GossipComplete()
end

-- Function to handle the selection of the gossip menu
local function BlackMarket_OnGossipSelect(event, player, creature, sender, intid, code)
    if intid == 999 then
        BlackMarket_OnGossipHello(event, player, creature) -- Go back to the class menu
    elseif intid >= 1000 then
        BlackMarket_OnGossipSelectOption(event, player, creature, sender, intid - 1000, code) -- Handle item purchase
    elseif CLASS_NAMES_AND_ICONS[intid] then
        ShowAvailableSets(player, creature, intid) -- Show armor sets for the selected class
    end
end

-- Register the NPC gossip events
RegisterCreatureGossipEvent(BLACK_MARKET_NPC_ID, 1, BlackMarket_OnGossipHello) -- GOSSIP_HELLO
RegisterCreatureGossipEvent(BLACK_MARKET_NPC_ID, 2, BlackMarket_OnGossipSelect) -- GOSSIP_SELECT
