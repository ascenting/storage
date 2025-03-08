local game = game.get_data_model()
local workspace_folder = game:find_first_child_of_class("Workspace")
local military = workspace_folder:find_first_child("Military")
local military_children = military:get_children()
local window_width, window_height = cheat.get_window_size()
local plants_folder = workspace_folder and workspace_folder:find_first_child("Plants")
local animals_folder = workspace_folder and workspace_folder:find_first_child("Animals")
local nodes_folder = workspace_folder and workspace_folder:find_first_child("Nodes")
local keycards_folder = workspace_folder and workspace_folder:find_first_child("Keycards")
local bases_folder = workspace_folder and workspace_folder:find_first_child("Bases")
local loners_folder = bases_folder and bases_folder:find_first_child("Loners")
local vegetation_folder = workspace_folder and workspace_folder:find_first_child("Vegetation")
local benchspawn_folder = workspace_folder and workspace_folder:find_first_child("BenchSpawnGroups")
local benchspawn_children = benchspawn_folder:get_children()
local players_instance = game:find_first_child("Players")
local bags = loners_folder:find_first_child("Body Bag")
local sleepers = loners_folder:find_first_child("Sleeper")

local reference = {
    accent = ui.reference("Settings", "Appearance", "Accent"),
    header = ui.reference("Settings", "Appearance", "Header"),
    container = ui.reference("Settings", "Appearance", "Container"),
    text = ui.reference("Settings", "Appearance", "Text"),
    text_active = ui.reference("Settings", "Appearance", "Text Active"),
}

local mods_names = { "neddleduck", "georgey1", "ChickenBagelz", "AsianAbrex", "Warm_Vibes", "YTGonzo", "tomsons57", "cleandrawls", "Rikumah", "harrib_allsack54321",
"dittrich11_yt", "HMH_Hazzz", "gofinek", "cinnphony", "Edvarddz", "kerub131", "kregixd", "GuyOne311", "baconman11538", "LUKASAJs", "Devlzy", "Lost_Test", "MiniatureSigy",
"KittenBagelz", "DoHbaccep_666", "Here4Money2", "ShadowsPetSnail"
}


local elements = {
    ["Anti-Clutter"] = ui.new_checkbox("Scripts", "Elements", "Anti-Clutter"),
    ["Mod/Admin Viewer"] = ui.new_checkbox("Scripts", "Elements", "Mod/Admin Viewer"),
    ["Sleeper ESP"] = ui.new_checkbox("Scripts", "Elements", "Sleeper ESP"),
    ["Sleeper Color"] = ui.new_colorpicker("Scripts", "Elements", "Sleeper Color", 255, 0, 0, 255, true),
    ["Sleeper Distance"] = ui.new_slider_int("Scripts", "Elements", "Sleeper Distance", 0, 3000, 500),
    ["Body Bag ESP"] = ui.new_checkbox("Scripts", "Elements", "Body Bag ESP"),
    ["Body Bag Color"] = ui.new_colorpicker("Scripts", "Elements", "Body Bag Color", 255, 0, 0, 255, true),
    ["Body Bag Distance"] = ui.new_slider_int("Scripts", "Elements", "Body Bag Distance", 0, 3000, 500),
    ["Soldier ESP"] = ui.new_checkbox("Scripts", "Elements", "Soldier ESP"),
    ["Soldier Color"] = ui.new_colorpicker("Scripts", "Elements", "Soldier Color", 255, 0, 0, 255, true),
    ["Soldier Distance ESP"] = ui.new_checkbox("Scripts", "Elements", "Soldier Distance ESP"),
    ["Soldier Tracers"] = ui.new_checkbox("Scripts", "Elements", "Soldier Tracers"),
    ["Soldier Distance"] = ui.new_slider_int("Scripts", "Elements", "Soldier Distance", 0, 3000, 500),
    ["Ore ESP"] = ui.new_checkbox("Scripts", "Elements", "Ore ESP"),
    ["Ore Distance ESP"] = ui.new_checkbox("Scripts", "Elements", "Ore Distance ESP"),
    ["Ore Tracers"] = ui.new_checkbox("Scripts", "Elements", "Ore Tracers"),
    ["Stone"] = ui.new_checkbox("Scripts", "Elements", "Stone"),
    ["Stone Color"] = ui.new_colorpicker("Scripts", "Elements", "Stone Color", 127, 127, 127, 255, true),
    ["Metal"] = ui.new_checkbox("Scripts", "Elements", "Metal"),
    ["Metal Color"] = ui.new_colorpicker("Scripts", "Elements", "Metal Color", 255, 155, 0, 255, true),
    ["Phosphate"] = ui.new_checkbox("Scripts", "Elements", "Phosphate"),
    ["Phosphate Color"] = ui.new_colorpicker("Scripts", "Elements", "Phosphate Color", 238, 229, 127, 255, true),
    ["Plants"] = ui.new_checkbox("Scripts", "Elements", "Plants"),
    ["Plants Distance ESP"] = ui.new_checkbox("Scripts", "Elements", "Plants Distance ESP"),
    ["Plants Tracers"] = ui.new_checkbox("Scripts", "Elements", "Plants Tracers"),
    ["Plants Distance"] = ui.new_slider_int("Scripts", "Elements", "Plants Distance", 0, 4000, 2000),
    ["Wool"] = ui.new_checkbox("Scripts", "Elements", "Wool"),
    ["Wool Color"] = ui.new_colorpicker("Scripts", "Elements", "Wool Color", 255, 255, 255, 255, true),
    ["Raspberry"] = ui.new_checkbox("Scripts", "Elements", "Raspberry"),
    ["Raspberry Color"] = ui.new_colorpicker("Scripts", "Elements", "Raspberry Color", 255, 123, 123, 255, true),
    ["Corn"] = ui.new_checkbox("Scripts", "Elements", "Corn"),
    ["Corn Color"] = ui.new_colorpicker("Scripts", "Elements", "Corn Color", 253, 255, 94, 255, true),
    ["Tomato"] = ui.new_checkbox("Scripts", "Elements", "Tomato"),
    ["Tomato Color"] = ui.new_colorpicker("Scripts", "Elements", "Tomato Color", 255, 108, 108, 255, true),
    ["Blueberry"] = ui.new_checkbox("Scripts", "Elements", "Blueberry"),
    ["Blueberry Color"] = ui.new_colorpicker("Scripts", "Elements", "Blueberry Color", 87, 160, 255, 255, true),
    ["Lemon"] = ui.new_checkbox("Scripts", "Elements", "Lemon"),
    ["Lemon Color"] = ui.new_colorpicker("Scripts", "Elements", "Lemon Color", 244, 255, 58, 255, true),
    ["Animals"] = ui.new_checkbox("Scripts", "Lua", "Animals"),
    ["Animals Distance ESP"] = ui.new_checkbox("Scripts", "Lua", "Animals Distance ESP"),
    ["Animals Tracers"] = ui.new_checkbox("Scripts", "Lua", "Animals Tracers"),
    ["Animals Distance"] = ui.new_slider_int("Scripts", "Lua", "Animals Distance", 0, 4000, 2000),
    ["Deer"] = ui.new_checkbox("Scripts", "Lua", "Deer"),
    ["Deer Color"] = ui.new_colorpicker("Scripts", "Lua", "Deer Color", 255, 203, 59, 255, true),
    ["Wildboar"] = ui.new_checkbox("Scripts", "Lua", "Wildboar"),
    ["Wildboar Color"] = ui.new_colorpicker("Scripts", "Lua", "Wildboar Color", 255, 186, 139, 255, true),
    ["Wolf"] = ui.new_checkbox("Scripts", "Lua", "Wolf"),
    ["Wolf Color"] = ui.new_colorpicker("Scripts", "Lua", "Wolf Color", 160, 0, 0, 255, true),
    ["Keycard ESP"] = ui.new_checkbox("Scripts", "Lua", "Keycard ESP"),
    ["Keycard ESP Color"] = ui.new_colorpicker("Scripts", "Lua", "Keycard ESP Color", 255, 186, 139, 255, true),
    ["Keycard ESP Distance ESP"] = ui.new_checkbox("Scripts", "Lua", "Keycard ESP Distance ESP"),
    ["Keycard ESP Tracers"] = ui.new_checkbox("Scripts", "Lua", "Keycard ESP Tracers"),
    ["Keycard ESP Distance"] = ui.new_slider_int("Scripts", "Lua", "Keycard ESP Distance", 0, 4000, 2000),
    ["DigPile ESP"] = ui.new_checkbox("Scripts", "Lua", "DigPile ESP"),
    ["DigPile ESP Color"] = ui.new_colorpicker("Scripts", "Lua", "DigPile ESP Color", 255, 186, 139, 255, true),
    ["DigPile ESP Distance ESP"] = ui.new_checkbox("Scripts", "Lua", "DigPile ESP Distance ESP"),
    ["DigPile ESP Tracers"] = ui.new_checkbox("Scripts", "Lua", "DigPile ESP Tracers"),
    ["DigPile ESP Distance"] = ui.new_slider_int("Scripts", "Lua", "DigPile ESP Distance", 0, 4000, 2000),
    ["Monument Spawns ESP"] = ui.new_checkbox("Scripts", "Lua", "Monument Spawns ESP"),
    ["Monument Spawns Distance ESP"] = ui.new_checkbox("Scripts", "Lua", "Monument Spawns Distance ESP"),
    ["Monument Spawns Tracers"] = ui.new_checkbox("Scripts", "Lua", "Monument Spawns Tracers"),
    ["Monument Spawns Distance"] = ui.new_slider_int("Scripts", "Lua", "Monument Spawns Distance", 0, 4000, 2000),
    ["Trash Can"] = ui.new_checkbox("Scripts", "Lua", "Trash Can"),
    ["Trash Can Color"] = ui.new_colorpicker("Scripts", "Lua", "Trash Can Color", 188, 188, 188, 255, true),
    ["Oil Barrel"] = ui.new_checkbox("Scripts", "Lua", "Oil Barrel"),
    ["Oil Barrel Color"] = ui.new_colorpicker("Scripts", "Lua", "Oil Barrel Color", 255, 80, 50, 255, true),
    ["Locked Wooden Crate"] = ui.new_checkbox("Scripts", "Lua", "Locked Wooden Crate"),
    ["Locked Wooden Crate Color"] = ui.new_colorpicker("Scripts", "Lua", "Locked Wooden Crate Color", 188, 110, 0, 255, true),
    ["Locked Metal Crate"] = ui.new_checkbox("Scripts", "Lua", "Locked Metal Crate"),
    ["Locked Metal Crate Color"] = ui.new_colorpicker("Scripts", "Lua", "Locked Metal Crate Color", 207, 207, 207, 255, true),
    ["Food Crate"] = ui.new_checkbox("Scripts", "Lua", "Food Crate"),
    ["Food Crate Color"] = ui.new_colorpicker("Scripts", "Lua", "Food Crate Color", 255, 245, 122, 255, true),
}

local g_nodes = {}
local g_plants = {}
local g_soldiers = {}
local g_animals = {}
local g_keycards = {}
local g_digpiles = {}
local g_benchspawns = {}
local g_mods = {}
local players_children = {}
local g_sleepers = {}
local g_bodybags = {}
local animal_children = {}

local function mouse_within(x, y, mx, my, w, h)
    return mx >= x and mx <= x + w and my >= y and my <= y + h
end

local dragging = false
local saved_pos = vector(0, 0, 0)
local offset = vector(0, 0, 0)

local function on_update_slow()
    players_children = players_instance:get_children()
    animal_children = animals_folder:get_children()

    if ui.get(elements["Ore ESP"]) then
        if nodes_folder then
            g_nodes = {}
            for _, node_folder in pairs(nodes_folder:get_children()) do
                local main = node_folder:find_first_child("Main")
                if main then
                    g_nodes[#g_nodes + 1] = {
                        name = node_folder:get_name(),
                        pos = vector(main:get_position())
                    }
                end
            end
        end
    end

    if ui.get(elements["Body Bag ESP"]) then
        g_bodybags = {}
        if not bags then return end
        for _, bag in pairs(bags:get_children()) do
            local main = bag:find_first_child("Main")
            if not main then return end
            if main then
                g_bodybags[#g_bodybags + 1] = {
                    name = "Body Bag",
                    pos = vector(main:get_position())
                }
            end
        end      
    end

    if ui.get(elements["Sleeper ESP"]) then
        for _, sleeper in pairs(sleepers:get_children()) do
            local sleeper_children = sleeper:get_children()
            local player_name = ""
            local position = vector(0, 0, 0)

            for _, child in pairs(sleeper_children) do
                local child_name = child:get_name()
                if child_name == "NameTag" then
                    player_name = child:find_first_child("Label"):get_textlabel_value()
                end

                if child_name == "Main" then
                    position = child:get_position()
                end
            end

            g_sleepers[#g_sleepers + 1] = {
                name = player_name,
                pos = vector(position)
            }
        end
    end

    if ui.get(elements["Monument Spawns ESP"]) then
        g_benchspawns = {}
        for _, monuments in pairs(benchspawn_children) do
            local children = monuments:get_children()
    
            if #children > 3 then
                for _, drop in pairs(children) do
                    local drop_name = drop:get_name()
                    drop_name = string.sub(drop_name, 3)
    
                    g_benchspawns[#g_benchspawns + 1] = {
                        name = drop_name,
                        pos = vector(drop:get_position())
                    }
                end
            end
        end
    end

    if ui.get(elements["DigPile ESP"]) then
        if nodes_folder then
            g_digpiles = {}
            for _, digpiles in pairs(vegetation_folder:get_children()) do
                local digpile_name = digpiles:get_name()
                if (digpile_name ~= "DigPile") then goto continue end

                local main = digpiles:find_first_child("Pos1")
                if main then
                    g_digpiles[#g_digpiles + 1] = {
                        name = digpile_name,
                        pos = vector(main:get_position())
                    }
                end
                ::continue::
            end
        end
    end

    if ui.get(elements["Keycard ESP"]) then
        if keycards_folder then
            g_keycards = {}
            for _, keycard in pairs(keycards_folder:get_children()) do
                local main = keycard:find_first_child("Main")
                if main then
                    g_keycards[#g_keycards + 1] = {
                        name = "Keycard",
                        pos = vector(main:get_position())
                    }
                end
            end
        end
    end

    if ui.get(elements["Plants"]) then
        if plants_folder then
            g_plants = {}
            for _, plant_folder in pairs(plants_folder:get_children()) do
                local main = plant_folder:find_first_child("Main")
                if main then
                    g_plants[#g_plants + 1] = {
                        name = plant_folder:get_name(),
                        pos = vector(main:get_position())
                    }
                end
            end
        end
    end
end

local function on_update()
    if ui.get(elements["Animals"]) then
        if animals_folder then
            g_animals = {}
            for _, node_folder in pairs(animal_children) do
                local main = node_folder:find_first_child("HumanoidRootPart")
                if main then
                    local full_name = node_folder:get_name()
                    local animal_name = full_name:sub(15):lower()
                    animal_name = animal_name:sub(1, 1):upper() .. animal_name:sub(2)
                    g_animals[#g_animals + 1] = {
                        name = animal_name,
                        pos = vector(main:get_position())
                    }
                end
            end
        end
    end
    if ui.get(elements["Soldier ESP"]) and military then
        g_soldiers = {}
        for _, bases in pairs(military_children) do
            for _, soldier_folder in pairs(bases:get_children()) do
                if soldier_folder:get_name() == "Soldier" then
                    local main = soldier_folder:find_first_child("HumanoidRootPart")
                    if main then
                        g_soldiers[#g_soldiers + 1] = {
                            name = "Soldier",
                            pos = vector(main:get_position())
                        }
                    end
                end
            end
        end
    end
end

local function get_closest(items, local_position)
    local closest_item = nil
    local min_distance = math.huge
    for _, item in pairs(items) do
        local distance = local_position:dist_to(item.pos)
        if distance < min_distance then
            min_distance = distance
            closest_item = item
        end
    end
    return closest_item
end


local function contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

local function draw_container(x, y, text)
    local height = 30;
    local padding = 20;
    local y_offset = 0;

    local text_size = vector(render.measure_text(2, false, text))

    local accent_clr = ui.get(reference.accent)
    local header_clr = ui.get(reference.header)
    local text_clr = ui.get(reference.text)

    render.rect(x, y, text_size.x + padding, height, header_clr[1], header_clr[2], header_clr[3], header_clr[4])
    render.rect(x, y + height - 2, text_size.x + padding, 2, accent_clr[1], accent_clr[2], accent_clr[3], accent_clr[4])
    render.text(x + padding / 2, y + height / 2 - text_size.y / 2, text_clr[1], text_clr[2], text_clr[3], text_clr[4], 2, false, text)

    for _, player in ipairs(players_children) do
        local text_clr = ui.get(reference.text_active)

        local player_name = player:get_name()
        local text_size = vector(render.measure_text(2, false, player_name))

        if (contains(mods_names, player_name)) then
            render.text(x, (y + height + 2) + y_offset, text_clr[1], text_clr[2], text_clr[3], text_clr[4], 2, false, player_name)
            y_offset = y_offset + text_size.y
        end
    end

    return {x=x, y=y, w=text_size.x + padding, h=height}
end

local function on_paint()
    local local_player = entity.get_local_player()
    local local_position = vector(local_player:get_position())
    local mouse_pos = vector(input.cursor_position())


    if ui.get(elements["DigPile ESP"]) then
        for _, digpile in pairs(g_digpiles) do
            local distance = local_position:dist_to(digpile.pos)
            distance = math.floor(distance + 0.5)

            local soldier_dist_slider = ui.get(elements["DigPile ESP Distance"])
            if soldier_dist_slider < distance then goto continue end

            local screen_pos = vector(utility.world_to_screen(digpile.pos:unpack()))
            if screen_pos:is_zero() then goto continue end

            local clr = ui.get(elements["DigPile ESP Color"])
            local w, h = render.measure_text(0, false, digpile.name)
            local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

            render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, digpile.name)

            if ui.get(elements["DigPile ESP Distance ESP"]) then
                render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
            end

            if ui.get(elements["DigPile ESP Tracers"]) then
                render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
            end
            ::continue::
        end
    end

    if ui.get(elements["Keycard ESP"]) then
        for _, keycard in pairs(g_keycards) do
            local distance = local_position:dist_to(keycard.pos)
            distance = math.floor(distance + 0.5)

            local soldier_dist_slider = ui.get(elements["Keycard ESP Distance"])
            if soldier_dist_slider < distance then goto continue end

            local screen_pos = vector(utility.world_to_screen(keycard.pos:unpack()))
            if screen_pos:is_zero() then goto continue end

            local clr = ui.get(elements["Keycard ESP Color"])
            local w, h = render.measure_text(0, false, keycard.name)
            local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

            render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, keycard.name)

            if ui.get(elements["Keycard ESP Distance ESP"]) then
                render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
            end

            if ui.get(elements["Keycard ESP Tracers"]) then
                render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
            end
            ::continue::
        end
    end

    if ui.get(elements["Soldier ESP"]) then
        for _, soldier in pairs(g_soldiers) do
            local distance = local_position:dist_to(soldier.pos)
            distance = math.floor(distance + 0.5)

            local soldier_dist_slider = ui.get(elements["Soldier Distance"])
            if soldier_dist_slider < distance then goto continue end

            local screen_pos = vector(utility.world_to_screen(soldier.pos:unpack()))
            if screen_pos:is_zero() then goto continue end

            local clr = ui.get(elements["Soldier Color"])
            local w, h = render.measure_text(0, false, soldier.name)
            local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

            render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, soldier.name)

            if ui.get(elements["Soldier Distance ESP"]) then
                render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
            end

            if ui.get(elements["Soldier Tracers"]) then
                render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
            end
            ::continue::
        end
    end

    if ui.get(elements["Monument Spawns ESP"]) then
        local monument_drops = {"Locked Wooden Crate", "Locked Metal Crate", "Oil Barrel", "Trash Can", "Food Crate"}
        for _, drop_type in ipairs(monument_drops) do
            if ui.get(elements[drop_type]) then
                local items_to_draw = {}
                for _, spawn in pairs(g_benchspawns) do
                    if spawn.name:match(drop_type) then
                        table.insert(items_to_draw, spawn)
                    end
                end

                if ui.get(elements["Anti-Clutter"]) then
                    local closest_item = get_closest(items_to_draw, local_position)
                    if closest_item then
                        items_to_draw = { closest_item }
                    else
                        items_to_draw = {}
                    end
                end

                for _, animal in pairs(items_to_draw) do
                    local clean_name = animal.name:match("([^_]+)")
                    if not ui.get(elements[clean_name]) then goto continue end

                    local screen_pos = vector(utility.world_to_screen(animal.pos:unpack()))
                    if screen_pos:is_zero() then goto continue end

                    local clr = ui.get(elements[clean_name .. " Color"])
                    local w, h = render.measure_text(0, false, clean_name)
                    local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                    local distance = local_position:dist_to(animal.pos)
                    distance = math.floor(distance + 0.5)

                    render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, clean_name)
                    if ui.get(elements["Monument Spawns Distance ESP"]) then
                        render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
                    end
                    if ui.get(elements["Monument Spawns Tracers"]) then
                        render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
                    end
                    ::continue::
                end
            end
        end
    end


    if ui.get(elements["Sleeper ESP"]) then
        for _, sleeper in pairs(g_sleepers) do
            local distance = local_position:dist_to(sleeper.pos)
            distance = math.floor(distance + 0.5)

            local soldier_dist_slider = ui.get(elements["Sleeper Distance"])
            if soldier_dist_slider < distance then goto continue end

            local screen_pos = vector(utility.world_to_screen(sleeper.pos:unpack()))
            if screen_pos:is_zero() then goto continue end

            local clr = ui.get(elements["Sleeper Color"])
            local w, h = render.measure_text(0, false, sleeper.name)
            local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

            render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, sleeper.name)
            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
            ::continue::
        end
    end

    if ui.get(elements["Body Bag ESP"]) then
        for _, bb in pairs(g_bodybags) do
            local distance = local_position:dist_to(bb.pos)
            distance = math.floor(distance + 0.5)

            local soldier_dist_slider = ui.get(elements["Body Bag Distance"])
            if soldier_dist_slider < distance then goto continue end

            local screen_pos = vector(utility.world_to_screen(bb.pos:unpack()))
            if screen_pos:is_zero() then goto continue end

            local clr = ui.get(elements["Body Bag Color"])
            local w, h = render.measure_text(0, false, bb.name)
            local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

            render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, bb.name)
            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
            ::continue::
        end
    end


    if ui.get(elements["Animals"]) then
        local animal_types = {"Deer", "Wildboar", "Wolf"}
        for _, animal_type in ipairs(animal_types) do
            if ui.get(elements[animal_type]) then
                local items_to_draw = {}
                for _, animal in pairs(g_animals) do
                    if animal.name:match(animal_type) then
                        table.insert(items_to_draw, animal)
                    end
                end

                if ui.get(elements["Anti-Clutter"]) then
                    local closest_item = get_closest(items_to_draw, local_position)
                    if closest_item then
                        items_to_draw = { closest_item }
                    else
                        items_to_draw = {}
                    end
                end

                for _, animal in pairs(items_to_draw) do
                    local clean_name = animal.name:match("([^_]+)")
                    if not ui.get(elements[clean_name]) then goto continue end

                    local screen_pos = vector(utility.world_to_screen(animal.pos:unpack()))
                    if screen_pos:is_zero() then goto continue end

                    local clr = ui.get(elements[clean_name .. " Color"])
                    local w, h = render.measure_text(0, false, clean_name)
                    local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                    local distance = local_position:dist_to(animal.pos)
                    distance = math.floor(distance + 0.5)

                    render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, clean_name)
                    if ui.get(elements["Animals Distance ESP"]) then
                        render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
                    end
                    if ui.get(elements["Animals Tracers"]) then
                        render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
                    end
                    ::continue::
                end
            end
        end
    end

    if ui.get(elements["Ore ESP"]) then
        local ore_types = {"Stone", "Metal", "Phosphate"}
        for _, ore_type in ipairs(ore_types) do
            if ui.get(elements[ore_type]) then
                local items_to_draw = {}
                for _, node in pairs(g_nodes) do
                    if node.name:match(ore_type) then
                        table.insert(items_to_draw, node)
                    end
                end

                if ui.get(elements["Anti-Clutter"]) then
                    local closest_item = get_closest(items_to_draw, local_position)
                    if closest_item then
                        items_to_draw = { closest_item }
                    else
                        items_to_draw = {}
                    end
                end

                for _, node in pairs(items_to_draw) do
                    local clean_name = node.name:match("([^_]+)")
                    if not ui.get(elements[clean_name]) then goto continue end

                    local screen_pos = vector(utility.world_to_screen(node.pos:unpack()))
                    if screen_pos:is_zero() then goto continue end

                    local clr = ui.get(elements[clean_name .. " Color"])
                    local w, h = render.measure_text(0, false, clean_name)
                    local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                    local distance = local_position:dist_to(node.pos)
                    distance = math.floor(distance + 0.5)

                    render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, clean_name)
                    if ui.get(elements["Ore Distance ESP"]) then
                        render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
                    end
                    if ui.get(elements["Ore Tracers"]) then
                        render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
                    end
                    ::continue::
                end
            end
        end
    end


    if ui.get(elements["Mod/Admin Viewer"]) then
        local test = draw_container(saved_pos.x, saved_pos.y, "Mod/Admin View")
        if (utility.key_state(0x01) and mouse_within(test.x, test.y, mouse_pos.x, mouse_pos.y, test.w, test.h)) then
            if not dragging then
                dragging = true
                offset.x = mouse_pos.x - test.x
                offset.y = mouse_pos.y - test.y
            else
                saved_pos.x = mouse_pos.x - offset.x
                saved_pos.y = mouse_pos.y - offset.y
            end
        else
            dragging = false
        end
    end

    if ui.get(elements["Plants"]) then
        local plant_types = {"Wool", "Raspberry", "Corn", "Tomato", "Blueberry", "Lemon"}
        for _, plant_type in ipairs(plant_types) do
            if ui.get(elements[plant_type]) then
                local items_to_draw = {}
                for _, plant in pairs(g_plants) do
                    if plant.name:match(plant_type) then
                        table.insert(items_to_draw, plant)
                    end
                end

                if ui.get(elements["Anti-Clutter"]) then
                    local closest_item = get_closest(items_to_draw, local_position)
                    if closest_item then
                        items_to_draw = { closest_item }
                    else
                        items_to_draw = {}
                    end
                end

                for _, plant in pairs(items_to_draw) do
                    local distance = local_position:dist_to(plant.pos)
                    distance = math.floor(distance + 0.5)

                    local plant_slider_dist = ui.get(elements["Plants Distance"])
                    if plant_slider_dist < distance then goto continue end

                    local clean_name = plant.name:match("([^_]+) ")
                    if not ui.get(elements[clean_name]) then goto continue end

                    local screen_pos = vector(utility.world_to_screen(plant.pos:unpack()))
                    if screen_pos:is_zero() then goto continue end

                    local clr = ui.get(elements[clean_name .. " Color"])
                    local w, h = render.measure_text(0, false, clean_name)
                    local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                    render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, clean_name)
                    if ui.get(elements["Plants Distance ESP"]) then
                        render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
                    end

                    if ui.get(elements["Plants Tracers"]) then
                        render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
                    end
                    ::continue::
                end
            end
        end
    end
end

print("free xix")
cheat.set_callback("update", on_update)
cheat.set_callback("update_slow", on_update_slow)
cheat.set_callback("paint", on_paint)
