--- STEAMODDED HEADER
--- MOD_NAME: Snow's Other Jokers
--- MOD_ID: SnowOtherJokers
--- MOD_AUTHOR: [RattlingSnow353]
--- MOD_DESCRIPTION: This mod adds a varity of jokers to the game. 
--- BADGE_COLOUR: 60efff
--- DISPLAY_NAME: Snow's Mods

----------------------------------------------
------------MOD CODE -------------------------

-- #### Check for Loaded Mods ####
-- Fusion Jokers
is_fusionJokers = not (SMODS.INIT.FusionJokers == nil)

local config = {
    -- Jokers
    coolEgg = true,
}

function Card:get_suit()
    if self.ability.effect == 'Stone Card' and not self.vampired then
        return -math.random(100, 1000000)
    end
    return self.base.suit
end

local seals = {
    "Gold",
    "Red",
    "Blue",
    "Purple"
}

local function is_face(card)
    local id = card:get_id()
    return id == 11 or id == 12 or id == 13
end

local function tables_equal(a, b)
    return table.concat(a) == table.concat(b)
end

local function tables_copy(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

function shakecard(self)
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

-- Save attributes
local attributes = {
    mult = {
        key = 'mult_dagonet',
        prev_key = 'prev_mult_dagonet',
        min = 0
    },
    mult_mod = {
        key = 'mult_mod_dagonet',
        prev_key = 'prev_mult_mod_dagonet',
        min = 0
    },
    chips = {
        key = 'chips_dagonet',
        prev_key = 'prev_chips_dagonet',
        min = 0
    },
    chip_mod = {
        key = 'chip_mod_dagonet',
        prev_key = 'prev_chips_mod_dagonet',
        min = 0
    },
    Xmult = {
        key = 'Xmult_dagonet',
        prev_key = 'prev_Xmult_dagonet',
        min = 1
    },
    Xmult_mod = {
        key = 'Xmult_mod_dagonet',
        prev_key = 'prev_Xmult_mod_dagonet',
        min = 0
    },
    x_mult = {
        key = 'x_mult_dagonet',
        prev_key = 'prev_x_mult_dagonet',
        min = 1
    },
    t_mult = {
        key = 't_mult_dagonet',
        prev_key = 'prev_t_mult_dagonet',
        min = 0
    },
    t_chips = {
        key = 't_chips_dagonet',
        prev_key = 'prev_t_chips_dagonet',
        min = 0
    },
    s_mult = {
        key = 's_mult_dagonet',
        prev_key = 'prev_s_mult_dagonet',
        min = 0
    },
    dollars = {
        key = 'dollars_dagonet',
        prev_key = 'prev_dollars_dagonet',
        min = 0
    },
    hand_add = {
        key = 'hand_add_dagonet',
        prev_key = 'prev_hand_add_dagonet',
        min = 0
    },
    discard_sub = {
        key = 'discard_sub_dagonet',
        prev_key = 'prev_discard_sub_dagonet',
        min = 0
    },
    odds = {
        key = 'odds_dagonet',
        prev_key = 'prev_odds_dagonet',
        min = 0
    },
    faces = {
        key = 'faces_dagonet',
        prev_key = 'prev_faces_dagonet',
        min = 0
    },
    max = {
        key = 'max_dagonet',
        prev_key = 'prev_max_dagonet',
        min = 0
    },
    min = {
        key = 'min_dagonet',
        prev_key = 'prev_min_dagonet',
        min = 0
    },
    every = {
        key = 'every_dagonet',
        prev_key = 'prev_every_dagonet',
        min = 0
    },
    increase = {
        key = 'increase_dagonet',
        prev_key = 'prev_increase_dagonet',
        min = 0
    },
    d_size = {
        key = 'd_size_dagonet',
        prev_key = 'prev_d_size_dagonet',
        min = 0
    },
    h_mod = {
        key = 'h_mod_dagonet',
        prev_key = 'prev_h_mod_dagonet',
        min = 0
    },
    h_plays = {
        key = 'h_plays_dagonet',
        prev_key = 'prev_h_plays_dagonet',
        min = 0
    },
    discards = {
        key = 'discards_dagonet',
        prev_key = 'prev_discards_dagonet',
        min = 0
    },
    req = {
        key = 'req_dagonet',
        prev_key = 'prev_req_dagonet',
        min = 0
    },
    percentage = {
        key = 'percentage_dagonet',
        prev_key = 'prev_percentage_dagonet',
        min = 0
    },
    base = {
        key = 'base_dagonet',
        prev_key = 'prev_base_dagonet',
        min = 0
    },
    repetitions = {
        key = 'repetitions_dagonet',
        prev_key = 'prev_repetitions_dagonet',
        min = 0
    },
    dollar_gain_one = {
        key = 'dollar_gain_one_dagonet',
        prev_key = 'prev_dollar_gain_one_dagonet',
        min = 0
    },
    dollar_gain_two = {
        key = 'dollar_gain_two_dagonet',
        prev_key = 'prev_dollar_gain_two_dagonet',
        min = 0
    },
    dollar_gain_three = {
        key = 'dollar_gain_three_dagonet',
        prev_key = 'prev_dollar_gain_three_dagonet',
        min = 0
    },
    dollar_gain_four = {
        key = 'dollar_gain_four_dagonet',
        prev_key = 'prev_dollar_gain_four_dagonet',
        min = 0
    },
    dollar_gain_five = {
        key = 'dollar_gain_five_dagonet',
        prev_key = 'prev_dollar_gain_five_dagonet',
        min = 0
    },
    extra = {
        key = 'extra_dagonet',
        prev_key = 'prev_extra_dagonet',
        min = 0
    }
}

local function create_tarot(joker, tarot)
    -- Check consumeable space
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        -- Add card
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        G.E_MANAGER:add_event(Event({
           trigger = 'before',
           delay = 0.0,
           func = (function()
               local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, tarot, '8ba')
               card:add_to_deck()
               G.consumeables:emplace(card)
               G.GAME.consumeable_buffer = 0
               return true
           end)
        }))

        -- Show message
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
           message = localize('k_plus_tarot'),
           colour = G.C.PURPLE
        })
    else
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
            message = localize('k_no_space_ex')
        })
    end
end

local function create_planet(joker, planet, other_joker)
    if #G.consumeables.cards + G.GAME.consumeable_buffer <
        G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        -- Add card
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, planet, 'blusl')
                card:add_to_deck()
                G.consumeables:emplace(card)
                G.GAME.consumeable_buffer = 0
                if other_joker then
                    other_joker:juice_up(0.5, 0.5)
                end
                return true
            end)
        }))

        -- Show message
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
            message = localize('k_plus_planet'),
            colour = G.C.SECONDARY_SET.Planet
        })
    else
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
            message = localize('k_no_space_ex')
        })
    end
end

local function create_joker(joker, cjoker, rarity)
    -- Check consumeable space
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        -- Add card
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
        G.E_MANAGER:add_event(Event({
           trigger = 'before',
           delay = 0.0,
           func = (function()
               local card = create_card('Joker', G.joker, rarity, nil, nil, nil, cjoker, 'len')
               card:add_to_deck()
               G.jokers:emplace(card)
               G.GAME.joker_buffer = 0
               return true
           end)
        }))

        -- Show message
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
           message = localize('k_plus_joker'),
           colour = G.C.PURPLE
        })
    else
        card_eval_status_text(joker, 'extra', nil, nil, nil, {
            message = localize('k_no_space_ex')
        })
    end
end

-- Increase base attributes
local function increase_attributes(k, v, place, multiplier)
    local attr = attributes[k]

    if not attr or type(v) == "string" then
        return
    end

    -- Handle extra seperately
    if type(v) == "table" then
        for k2, v2 in pairs(place.extra) do
            increase_attributes(k2, v2, place.extra, multiplier)
        end
    elseif v > attr.min then
        if place[attr.prev_key] == nil then
            place[attr.prev_key] = multiplier
        end
        if place[attr.key] == nil then
            -- Save base value
            place[attr.key] = v
        else
            if not (v / multiplier == place[attr.key] and place[attr.prev_key] == multiplier) then
                if not (v / multiplier == place[attr.key] or v / place[attr.prev_key] == place[attr.key]) then
                    if v / multiplier ~= place[attr.key] and place[attr.prev_key] == multiplier then
                        -- Update base based on current multiplier
                        local increase = (v / multiplier - place[attr.key]) * multiplier
                        place[attr.key] = place[attr.key] + increase
                    else
                        -- Update base based on previous multiplier
                        local increase = (v / place[attr.prev_key] - place[attr.key]) * place[attr.prev_key]
                        place[attr.key] = place[attr.key] + increase
                    end
                end
            end
        end
        -- Multiply attribute
        place[k] = place[attr.key] * multiplier
        place[attr.prev_key] = multiplier
    end
end

local function not_in_table(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return false
        end
    end
    return true
end

local function init_joker(joker, no_sprite)
    no_sprite = no_sprite or false

    local joker = SMODS.Joker:new(
        joker.ability_name,
        joker.slug,
        joker.ability,
        { x = 0, y = 0 },
        joker.loc,
        joker.rarity,
        joker.cost,
        joker.unlocked,
        joker.discovered,
        joker.blueprint_compat,
        joker.eternal_compat,
        joker.effect,
        joker.atlas,
        joker.soul_pos
    )
    joker:register()
    if not no_sprite then
        local sprite = SMODS.Sprite:new(
            joker.slug,
            SMODS.findModByID("SnowOtherJokers").path,
            joker.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite:register()
    end
end


function SMODS.INIT.SnowOtherJokers()

    G.localization.misc.v_dictionary.soj_null = "you should not be getting this!"
    G.localization.misc.v_dictionary.soj_chips = {"+#1# Chips !"}

    init_localization()

    local snowOtherJokers = SMODS.findModByID('SnowOtherJokers')

    if config.coolEgg and is_fusionJokers then
        -- Create Cool Egg Joker
        local coeg = {
            loc = {
                name = "Cool Egg",
                text = {
                    "Gains {C:money}$#3#{} in {C:attention}sell value{} and",
                    "{C:chips}+#2#{} chips every round",
                    "{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips)",
                }
            },
            ability_name = "coolEgg",
            slug = "cool_egg",
            ability = {
                extra = {money = 4, current_chips = 200, chip_mod = 15}  
            },
            rarity = 5,
            cost = 10,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true,
            soul_pos = { x = 1, y = 0 }
        }

        -- Initialize Cool Egg Joker
        init_joker(coeg)

        -- Set local variables for Cool Egg Joker
        function SMODS.Jokers.j_cool_egg.loc_def(card)
            return {card.ability.extra.current_chips, card.ability.extra.chip_mod, card.ability.extra.money}
        end

        SMODS.Jokers.j_cool_egg.calculate = function(self, context)
            if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
                self.ability.extra.current_chips = self.ability.extra.current_chips + self.ability.extra.chip_mod
                self.ability.extra_value = self.ability.extra_value + self.ability.extra.money
                self:set_cost()
                return {
                    message = localize {
                        type = 'variable',
                        key = 'soj_chips',
                        vars = { self.ability.extra.chip_mod },
                    },
                    card = self,
                    message = localize('k_val_up'),
                    colour = G.C.MONEY,
                }
            end
            if SMODS.end_calculate_context(context) then
                if self.ability.extra.current_chips > 0 then
                    return {
                        message = localize{type='variable',key='soj_chips',vars={self.ability.extra.current_chips}},
                        chip_mod = self.ability.extra.current_chips,
                        card = self
                    }
                end
            end
        end
    end 

    if is_fusionJokers then
        FusionJokers.fusions:add_fusion("j_stuntman", nil, false, "j_egg", nil, false, "j_cool_egg", 8)
    end
end

function Tag:init(_tag, for_collection, _blind_type)
    self.key = _tag
    local proto = G.P_TAGS[_tag] or G.tag_undiscovered
    self.config = copy_table(proto.config)
    self.pos = proto.pos
    self.name = proto.name
    self.tally = G.GAME.tag_tally or 0
    self.triggered = false
    G.tagid = G.tagid or 0
    self.ID = G.tagid
    G.tagid = G.tagid + 1
    self.ability = {
        orbital_hand = '['..localize('k_poker_hand')..']',
        blind_type = _blind_type
    }
    G.GAME.tag_tally = G.GAME.tag_tally and (G.GAME.tag_tally + 1) or 1
    if not for_collection then self:set_ability() end
end

----------------------------------------------
------------MOD CODE END---------------------