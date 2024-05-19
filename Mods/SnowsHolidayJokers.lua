--- STEAMODDED HEADER
--- MOD_NAME: Snow's Holiday Jokers
--- MOD_ID: SnowHolidayJokers
--- MOD_AUTHOR: [RattlingSnow353]
--- MOD_DESCRIPTION: This mod adds a varity of jokers to the game. 
--- BADGE_COLOUR: 60efff
--- DISPLAY_NAME: Snow's Mods

----------------------------------------------
------------MOD CODE -------------------------
local config = {
    -- Jokers
    dawndeck = true,
    eggBasket = true,
    seventhHeaven = true,
    clover = true,
    ritualSacrifice = true,
    verdantShift = true,
    foolsfortune = true,
    combatconfection = true,
    blackswan = true,
    loveisblind = true,
    turkeydinner = true,
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


function SMODS.INIT.SnowHolidayJokers()

    G.localization.misc.v_dictionary.sj_shift = "Bonus!"
    G.localization.misc.v_dictionary.sj_mult = {"+#1# Mult!"}
    G.localization.misc.v_dictionary.sj_xmult = {"+#1# Xmult!"}
    G.localization.misc.v_dictionary.sj_chips = {"+#1# Chips !"}
    G.localization.misc.v_dictionary.sj_enhanced = "Enhanced!"
    G.localization.misc.v_dictionary.sj_blindmoney = {"Win, -$#1#!"}

    init_localization()

    local snowHolidayJokers = SMODS.findModByID('SnowHolidayJokers')

    if config.eggBasket then
        -- Create Egg Basket Joker
        local eggs = {
            loc = {
                name = "Egg Basket",
                text = {
                    "Gains {C:money}$#3#{} in {C:attention}sell value{} every round.",
                    "{C:green,E:1,S:1.1}#2# in #1#{} chance this is {C:mult}destroyed{}",
                    "at the end of round.",
                    "{C:inactive}Art by {C:green,E:1,S:1.1}Grassy{}"
                }
            },
            ability_name = "eggBasket",
            slug = "egg_basket",
            ability = {
                extra = {odds = 4, _every = 1, money = 7}  
            },
            rarity = 1,
            cost = 4,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Egg Basket Joker
        local joker_eggs = SMODS.Joker:new(
            eggs.ability_name,
            eggs.slug,
            eggs.ability,
            { x = 0, y = 0 },
            eggs.loc,
            eggs.rarity,
            eggs.cost,
            eggs.unlocked,
            eggs.discovered,
            eggs.blueprint_compat,
            eggs.eternal_compat
        )
        joker_eggs:register()

        -- Initialize Sprite for Egg Basket Joker
        local sprite_eggs = SMODS.Sprite:new(
            "j_" .. eggs.slug,
            snowHolidayJokers.path,
            "j_" .. eggs.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_eggs:register()

        -- Set local variables for Egg Basket Joker
        function SMODS.Jokers.j_egg_basket.loc_def(card)
            return { card.ability.extra.odds, '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.money}
        end

        SMODS.Jokers.j_egg_basket.calculate = function(self, context)
            if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
                self.ability.extra._every = self.ability.extra._every - 1

                if self.ability.extra._every <= 0 then
                    self.ability.extra_value = self.ability.extra_value + self.ability.extra.money
                    self:set_cost()
                    self.ability.extra._every = self.ability.extra._every + 1
                    if pseudorandom('lucky_money') < G.GAME.probabilities.normal / self.ability.extra.odds then
                        self:start_dissolve()
                        return
                    end
                    return {
                        message = localize('k_val_up'),
                        colour = G.C.MONEY
                    }
                end
            end
        end
    end
    if config.ritualSacrifice then
        -- Create Ritual Sacrifice Joker
        local risa = {
            loc = {
                name = "Ritual Sacrifice",
                text = {
                    "If {C:attention}consumable{} slots are full when",
                    "blind is selected, {C:mult}destroy{} all {C:attention}consumables{}",
                    "and create a random {C:blue}Spectral{} card.",
                    "{C:inactive}Art by {C:red,E:1,S:1.1}CADIO{}"
                }
            },
            ability_name = "ritualSacrifice",
            slug = "ritual_sacrifice",
            ability = {
                extra = {}  
            },
            rarity = 3,
            cost = 8,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Ritual Sacrifice Joker
        local joker_risa = SMODS.Joker:new(
            risa.ability_name,
            risa.slug,
            risa.ability,
            { x = 0, y = 0 },
            risa.loc,
            risa.rarity,
            risa.cost,
            risa.unlocked,
            risa.discovered,
            risa.blueprint_compat,
            risa.eternal_compat
        )
        joker_risa:register()

        -- Initialize Sprite for Ritual Sacrifice Joker
        local sprite_risa = SMODS.Sprite:new(
            "j_" .. risa.slug,
            snowHolidayJokers.path,
            "j_" .. risa.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_risa:register()

        -- Set local variables for Ritual Sacrifice Joker
        function SMODS.Jokers.j_ritual_sacrifice.loc_def(card)
            return { }
        end

        SMODS.Jokers.j_ritual_sacrifice.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced then
                if G.consumeables.config.card_limit == #G.consumeables.cards then
                    for i=#G.consumeables.cards, 1, -1 do
                      G.consumeables.cards[i]:start_dissolve(nil, i == 1)
                    end
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
				    G.E_MANAGER:add_event(Event({
					    trigger = 'before',
					    delay = 0.0,
					    func = (function()
							    local self = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
							    self:add_to_deck()
							    G.consumeables:emplace(self)
							    G.GAME.consumeable_buffer = 0
						    return true
					    end)}))
                    return {
                        message = localize('k_plus_spectral')
                    }
                end
            end
        end
    end
    if config.seventhHeaven then
        -- Create 7th Heaven Joker
        local sehe = {
            loc = {
                name = "7th Heaven",
                text = {
                    "If played hand is a",
                    "single {C:attention}7{} create a",
                    "{C:attention}Judgement tarot{}",
                    "{C:inactive}(Must have room){}"
                }
            },
            ability_name = "seventhHeaven",
            slug = "seventh_heaven",
            ability = {
                extra = {}  
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize 7th Heaven Joker
        local joker_sehe = SMODS.Joker:new(
            sehe.ability_name,
            sehe.slug,
            sehe.ability,
            { x = 0, y = 0 },
            sehe.loc,
            sehe.rarity,
            sehe.cost,
            sehe.unlocked,
            sehe.discovered,
            sehe.blueprint_compat,
            sehe.eternal_compat
        )
        joker_sehe:register()

        -- Initialize Sprite for 7th Heavene Joker
        local sprite_sehe = SMODS.Sprite:new(
            "j_" .. sehe.slug,
            snowHolidayJokers.path,
            "j_" .. sehe.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_sehe:register()

        -- Set local variables for 7th Heaven Joker
        function SMODS.Jokers.j_seventh_heaven.loc_def(card)
            return { }
        end

        SMODS.Jokers.j_seventh_heaven.calculate = function(self, context)
            -- Animate card
            if context.first_hand_drawn then
                local eval = function()
                    return G.GAME.current_round.hands_played == G.GAME.current_round.hands_played
                end
                juice_card_until(self, eval, true)
            end
            if G.GAME.current_round.hands_played == G.GAME.current_round.hands_played then
                if context.before then
                    if #context.full_hand == 1 and context.full_hand[1]:get_id() == 7 then
                       create_tarot(self, "c_judgement")
                    end
                end
            end
        end
    end
    if config.dawndeck then
        -- Create Dawn Deck Joker
        local dade = {
            loc = {
                name = "Dawn Deck",
                text = {
                    "{C:attention}Retrigger{} all cards {C:mult}twice{}",
                    "on final played hand",
                    "{C:inactive} Can only be found in Dawn Deck"
                }
            },
            ability_name = "dawndeck",
            slug = "dawn_deck",
            ability = {
                extra = {}  
            },
            rarity = 4,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = false,
            eternal_compat = true
        }

        -- Initialize Dawn Deck Joker
        local joker_dade = SMODS.Joker:new(
            dade.ability_name,
            dade.slug,
            dade.ability,
            { x = 0, y = 0 },
            dade.loc,
            dade.rarity,
            dade.cost,
            dade.unlocked,
            dade.discovered,
            dade.blueprint_compat,
            dade.eternal_compat
        )
        joker_dade:register()

        -- Initialize Sprite for Dawn Deck Joker
        local sprite_dade = SMODS.Sprite:new(
            "j_" .. dade.slug,
            snowHolidayJokers.path,
            "j_" .. dade.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_dade:register()

        SMODS.Jokers.j_dawn_deck.yes_pool_flag = 'dawn_flag'

        -- Set local variables for Dawn Deck Joker
        function SMODS.Jokers.j_dawn_deck.loc_def(card)
            return { }
        end

        SMODS.Jokers.j_dawn_deck.calculate = function(self, context)
            -- Animate card
            if context.first_hand_drawn then
                local eval = function()
                    return G.GAME.current_round.hands_left == 0
                end
                juice_card_until(self, eval, true)
            end
            if G.GAME.current_round.hands_left == 0 then
                if context.repetition and context.cardarea == G.play then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 2,
                        card = self
                    }
                end
            end
        end
    end
    if config.clover then
        -- Create Clover Joker
        local clov = {
            loc = {
                name = "Clover",
                text = {
                    "Rerolls cost {C:money}$#3#{} less.",
                    "{C:green,E:1,S:1.1}#2# in #1#{} chance to decrease",
                    "price by {C:money}$#4#{} when blind is selected.",
                }
            },
            ability_name = "clover",
            slug = "clover",
            ability = {
                extra = {odds = 4, money = 4, cr = 1, submon = 1}  
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Clover Joker
        local joker_clov = SMODS.Joker:new(
            clov.ability_name,
            clov.slug,
            clov.ability,
            { x = 0, y = 0 },
            clov.loc,
            clov.rarity,
            clov.cost,
            clov.unlocked,
            clov.discovered,
            clov.blueprint_compat,
            clov.eternal_compat
        )
        joker_clov:register()

        -- Initialize Sprite for Clover Joker
        local sprite_clov = SMODS.Sprite:new(
            "j_" .. clov.slug,
            snowHolidayJokers.path,
            "j_" .. clov.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_clov:register()

        -- Set local variables for Clover Joker
        function SMODS.Jokers.j_clover.loc_def(card)
            return {card.ability.extra.odds, '' .. (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.money, card.ability.extra.submon}
        end

        SMODS.Jokers.j_clover.calculate = function(self, context)
             if context.setting_blind and not self.getting_sliced then
                G.E_MANAGER:add_event(Event({func = function()
                    if pseudorandom('lucky_money') < G.GAME.probabilities.normal / self.ability.extra.odds then
                        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + self.ability.extra.money
                        self.ability.extra.money = self.ability.extra.money - self.ability.extra.submon
                        self.ability.extra.cr = 1
                        if self.ability.extra.money == 0 then
                            self:start_dissolve()
                            return
                        end
                    end
                    if self.ability.extra.cr == 1 then
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - self.ability.extra.money
                    self.ability.extra.cr = 0
                    end
                return true end }))
            end
        end
    end
    if config.verdantShift then
        -- Create Verdant Shift Joker
        local vesh = {
            loc = {
                name = "Verdant Shift",
                text = {
                    "{C:purple}#4#{}{C:black}#2#{}",
                    "{C:black}#3#{}",
                    "{C:inactive}(Currently {C:chips}+#5#{C:inactive} Chips, {C:mult}+#6#{C:inactive} Mult)",
                    "{C:inactive}Art by {C:red,E:1,S:1.1}CADIO{}"
                }
            },
            ability_name = "verdantshift",
            slug = "verdant_shift",
            ability = {
                extra = {suitnum = 1 , line1 = " a season in order", line2 = "whenever a blind is selected", 
                curseason = "Picks", current_chips = 1, chip_mod = 4, current_mult = 1, mult_mod = 3, base = 1}  
            },
            rarity = 3,
            cost = 8,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Verdant Shift Joker
        local joker_vesh = SMODS.Joker:new(
            vesh.ability_name,
            vesh.slug,
            vesh.ability,
            { x = 0, y = 0 },
            vesh.loc,
            vesh.rarity,
            vesh.cost,
            vesh.unlocked,
            vesh.discovered,
            vesh.blueprint_compat,
            vesh.eternal_compat
        )
        joker_vesh:register()

        -- Initialize Sprite for Verdant Shift Joker
        local sprite_vesh = SMODS.Sprite:new(
            "j_" .. vesh.slug,
            snowHolidayJokers.path,
            "j_" .. vesh.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_vesh:register()

        -- Set local variables for Verdant Shift Joker
        function SMODS.Jokers.j_verdant_shift.loc_def(card)
            return {card.ability.extra.suitnum, card.ability.extra.line1, card.ability.extra.line2, card.ability.extra.curseason, card.ability.extra.current_chips, card.ability.extra.current_mult}
        end

        SMODS.Jokers.j_verdant_shift.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced then
                if self.ability.extra.suitnum == 1 then
                    self.ability.extra.curseason = "Spring"
                    self.ability.extra.line1 = ": each played card with the club"
                    self.ability.extra.line2 = "suit gives random enhancement to it."
                    self.ability.extra.suitnum = self.ability.extra.suitnum + 1
                elseif self.ability.extra.suitnum == 2 then
                    self.ability.extra.curseason = "Summer"
                    self.ability.extra.line1 = ": +3 Mult for each played"
                    self.ability.extra.line2 = "card with the heart suit."
                    self.ability.extra.suitnum = self.ability.extra.suitnum + 1
                elseif self.ability.extra.suitnum == 3 then
                    self.ability.extra.curseason = "Autumn"
                    self.ability.extra.line1 = ": +4 chips for each discarded"
                    self.ability.extra.line2 = "card with the diamond suit."
                    self.ability.extra.suitnum = self.ability.extra.suitnum + 1
                elseif self.ability.extra.suitnum == 4 then
                    self.ability.extra.curseason = "Winter"
                    self.ability.extra.line1 = ": each discarded card with the spade"
                    self.ability.extra.line2 = "suit gives random enhancement to it."
                    self.ability.extra.suitnum =  1
                end
            end
            if context.cardarea == G.play and context.individual then
                if self.ability.extra.suitnum == 2 and context.other_card:is_suit('Clubs') then
                    --Spring
                    shakecard(self)
                    local cen_pool = {}
                    for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if v.key ~= 'm_stone' then 
                            cen_pool[#cen_pool+1] = v
                        end
                    end
                    center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))

                    context.other_card:set_ability(center, nil, true)

                    return {
                        message = localize {
                            type = 'variable',
                            key = 'sj_enhanced',
                            vars = { }
                        },
                        card = context.other_card
                    }
                end
            end
            if context.discard and not context.other_card.debuff then
                if self.ability.extra.suitnum == 4 and context.other_card:is_suit('Diamonds') then
                    --Autumn
                    self.ability.extra.current_chips = self.ability.extra.current_chips + self.ability.extra.chip_mod
                    return {
                        message = localize {
                            type = 'variable',
                            key = 'sj_chips',
                            vars = { self.ability.extra.chip_mod }
                        },
                        card = self
                    }
                end
            end
            if SMODS.end_calculate_context(context) then
                if self.ability.extra.current_mult > 0 or self.ability.extra.current_chips > 0 then
                    return {
                        -- Return bonus message and apply bonus
                        message = localize{type='variable',key='sj_shift',vars={self.ability.extra.mult, self.ability.extra.chips}},
                        mult_mod = self.ability.extra.current_mult,
                        chip_mod = self.ability.extra.current_chips,
                        card = self
                    }
                end
            end
            if context.individual and context.cardarea == G.play then
                if self.ability.extra.suitnum == 3 and context.other_card:is_suit('Hearts') then
                    --Summer
                    self.ability.extra.current_mult = self.ability.extra.current_mult + self.ability.extra.mult_mod
                    return {
                        message = localize {
                            type = 'variable',
                            key = 'sj_mult',
                            vars = { self.ability.extra.mult_mod }
                        },
                        card = self
                    }
                end
            end
            if context.discard and not context.other_card.debuff then
                if self.ability.extra.suitnum == 1 and context.other_card:is_suit('Spades') then
                    --Winter
                    shakecard(self)
                    local cen_pool = {}
                    for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if v.key ~= 'm_stone' then 
                            cen_pool[#cen_pool+1] = v
                        end
                    end
                    center = pseudorandom_element(cen_pool, pseudoseed('spe_card'))

                    context.other_card:set_ability(center, nil, true)

                    return {
                        message = localize {
                            type = 'variable',
                            key = 'sj_enhanced',
                            vars = { }
                        },
                        card = context.other_card
                    }
                end
            end
        end
    end
    if config.foolsfortune then
        -- Create Fool's Fortune Joker
        local fofo = {
            loc = {
                name = "Fool's Fortune",
                text = {
                    "Sell this card to create",
                    "{C:attention}2{} free copies of {C:tarot}The Fool{}",
                    "{C:inactive}(Must have room, Only works during play){}"
                }
            },
            ability_name = "foolsfortune",
            slug = "fools_fortune",
            ability = {
                extra = {extra_value = 2, fofoc = 1, money = 2}  
            },
            rarity = 2,
            cost = 7,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = false
        }

        -- Initialize Fool's Fortune Joker
        local joker_fofo = SMODS.Joker:new(
            fofo.ability_name,
            fofo.slug,
            fofo.ability,
            { x = 0, y = 0 },
            fofo.loc,
            fofo.rarity,
            fofo.cost,
            fofo.unlocked,
            fofo.discovered,
            fofo.blueprint_compat,
            fofo.eternal_compat
        )
        joker_fofo:register()

        -- Initialize Sprite for Fool's Fortune Joker
        local sprite_fofo = SMODS.Sprite:new(
            "j_" .. fofo.slug,
            snowHolidayJokers.path,
            "j_" .. fofo.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_fofo:register()

        -- Set local variables for Fool's Fortune Joker
        function SMODS.Jokers.j_fools_fortune.loc_def(card)
            return {}
        end

        SMODS.Jokers.j_fools_fortune.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced then
                self.ability.extra_value = self.ability.extra_value - self.ability.extra.money
                self:set_cost()
                self.ability.extra.money = self.ability.extra_value
            end
            if context.selling_self then
                if G.STATE ~= G.STATES.SELECTING_HAND then
                    return
                end
                create_tarot(self, "c_fool")
                create_tarot(self, "c_fool")
            end
        end
    end
    if config.combatconfection then
        -- Create Combat Confection Joker
        local coco = {
            loc = {
                name = "Combat Confection",
                text = {
                    "If every scored card in",
                    "played hand is a {C:Spades}Spade",
                    "gain {C:mult}X#2#{} Mult.",
                    "{C:inactive}(Currently{} {C:mult}X#1#{} {C:inactive}Mult){}"
                }
            },
            ability_name = "combatconfection",
            slug = "combat_confection",
            ability = {
                extra = { 
                    current_Xmult = 1.6,
                    Xmult_mod = 0.13,
                    base = 1.6
                }  
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Combat Confection Joker
        local joker_coco = SMODS.Joker:new(
            coco.ability_name,
            coco.slug,
            coco.ability,
            { x = 0, y = 0 },
            coco.loc,
            coco.rarity,
            coco.cost,
            coco.unlocked,
            coco.discovered,
            coco.blueprint_compat,
            coco.eternal_compat
        )
        joker_coco:register()

        -- Initialize Sprite for Combat Confection Joker
        local sprite_coco = SMODS.Sprite:new(
            "j_" .. coco.slug,
            snowHolidayJokers.path,
            "j_" .. coco.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_coco:register()

        -- Set local variables for Combat Confection Joker
        function SMODS.Jokers.j_combat_confection.loc_def(card)
            return {card.ability.extra.current_Xmult, card.ability.extra.Xmult_mod}
        end

        SMODS.Jokers.j_combat_confection.calculate = function(self, context)
            if context.joker_main and context.cardarea == G.jokers then
                local bolcoco = true 
                for k, v in ipairs(context.full_hand) do 
                    bolcoco = bolcoco and (v:get_suit() == 'Spades') 
                end 
                if not bolcoco then 
                    return {
                        message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.extra.current_Xmult } },
                        Xmult_mod = self.ability.extra.current_Xmult
                    }
                else
                    self.ability.extra.current_Xmult = self.ability.extra.current_Xmult + self.ability.extra.Xmult_mod
                    message = localize { type = 'variable', key = 'sj_xmult', vars = { self.ability.extra.Xmult_mod } }
                end 
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { self.ability.extra.current_Xmult } },
                    Xmult_mod = self.ability.extra.current_Xmult
                }
            end
        end
    end
    if config.blackswan then
        -- Create Black Swan Joker
        local blsw = {
            loc = {
                name = "Black Swan",
                text = {
                    "Playing a {C:attention}#1#{} of",
                    "face cards gives {C:mult}+10{} Mult",
                    "{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult)",
                }
            },
            ability_name = "blackswan",
            slug = "black_swan",
            ability = {
                extra = { 
                    poker_hand = "Pair",
                    mult_mod = 10,
                    current_mult = 10,
                    mm = false

                }  
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Black Swan Joker
        local joker_blsw = SMODS.Joker:new(
            blsw.ability_name,
            blsw.slug,
            blsw.ability,
            { x = 0, y = 0 },
            blsw.loc,
            blsw.rarity,
            blsw.cost,
            blsw.unlocked,
            blsw.discovered,
            blsw.blueprint_compat,
            blsw.eternal_compat
        )
        joker_blsw:register()

        -- Initialize Sprite for Black Swan Joker
        local sprite_blsw = SMODS.Sprite:new(
            "j_" .. blsw.slug,
            snowHolidayJokers.path,
            "j_" .. blsw.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_blsw:register()

        -- Set local variables for Black Swan Joker
        function SMODS.Jokers.j_black_swan.loc_def(card)
            return {localize(card.ability.extra.poker_hand, 'poker_hands'),card.ability.extra.current_mult}
        end

        SMODS.Jokers.j_black_swan.calculate = function(self, context)
            if context.before and context.scoring_name == self.ability.extra.poker_hand then
                self.ability.extra.mm = true
            end

            if context.cardarea == G.play and context.individual then
                if is_face(context.other_card) and self.ability.extra.mm == true then
                    message = localize {
                        type = 'variable',
                        key = 'sj_mult',
                        vars = { self.ability.extra.mult_mod }
                    }
                    self.ability.extra.current_mult = self.ability.extra.current_mult + self.ability.extra.mult_mod/2
                end
            end
            if context.joker_main and context.cardarea == G.jokers then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'sj_shift'
                    },
                    mult_mod = self.ability.extra.current_mult
                }
            end
        end
    end
    if config.loveisblind then
        -- Create Love Is Blind Joker
        local lobl = {
            loc = {
                name = "Love Is Blind",
                text = {
                    "{C:mult}X#1# Mult{}, all non-hearts cards in",
                    "hand become face down for the round",
                }
            },
            ability_name = "loveisblind",
            slug = "love_is_blind",
            ability = {
                extra = { 
                    current_Xmult = 3

                }  
            },
            rarity = 2,
            cost = 6,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = true
        }

        -- Initialize Love Is Blind Joker
        local joker_lobl = SMODS.Joker:new(
            lobl.ability_name,
            lobl.slug,
            lobl.ability,
            { x = 0, y = 0 },
            lobl.loc,
            lobl.rarity,
            lobl.cost,
            lobl.unlocked,
            lobl.discovered,
            lobl.blueprint_compat,
            lobl.eternal_compat
        )
        joker_lobl:register()

        -- Initialize Sprite for Love Is Blind Joker
        local sprite_lobl = SMODS.Sprite:new(
            "j_" .. lobl.slug,
            snowHolidayJokers.path,
            "j_" .. lobl.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_lobl:register()

        -- Set local variables for Love Is Blind Joker
        function SMODS.Jokers.j_love_is_blind.loc_def(card)
            return {card.ability.extra.current_Xmult}
        end

        SMODS.Jokers.j_love_is_blind.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced then
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i].facing == 'front' then 
                        if not G.hand.cards[i]:is_suit("Hearts")  then
                            G.hand.cards[i]:flip()
                        end
                    end
                end
            end
            if context.joker_main and context.cardarea == G.jokers then
                return {
                    message = localize {
                        type = 'variable',
                        key = 'sj_shift'
                    },
                    Xmult_mod = self.ability.extra.current_Xmult 
                }
            end
        end
    end
    if config.turkeydinner then
        -- Create Turkey Dinner Joker
        local tudi = {
            loc = {
                name = "Turkey Dinner",
                text = {
                    "Sell this card to {C:attention}instantly win{}",
                    "current blind",
                    "{C:inactive}(Only works during play, Does not work on Bosses){}"
                }
            },
            ability_name = "turkeydinner",
            slug = "turkey_dinner",
            ability = {
                extra = { 
                    money = 4
                }  
            },
            rarity = 3,
            cost = 12,
            unlocked = true,
            discovered = true,
            blueprint_compat = true,
            eternal_compat = false
        }

        -- Initialize Turkey Dinner Joker
        local joker_tudi = SMODS.Joker:new(
            tudi.ability_name,
            tudi.slug,
            tudi.ability,
            { x = 0, y = 0 },
            tudi.loc,
            tudi.rarity,
            tudi.cost,
            tudi.unlocked,
            tudi.discovered,
            tudi.blueprint_compat,
            tudi.eternal_compat
        )
        joker_tudi:register()

        -- Initialize Sprite for Turkey Dinner Joker
        local sprite_tudi = SMODS.Sprite:new(
            "j_" .. tudi.slug,
            snowHolidayJokers.path,
            "j_" .. tudi.slug .. ".png",
            71,
            95,
            "asset_atli"
        )
        sprite_tudi:register()

        -- Set local variables for Turkey Dinner Joker
        function SMODS.Jokers.j_turkey_dinner.loc_def(card)
            return {}
        end

        SMODS.Jokers.j_turkey_dinner.calculate = function(self, context)
            if context.setting_blind and not self.getting_sliced then
                self.ability.extra_value = self.ability.extra_value - self.ability.extra.money
                self:set_cost()
                self.ability.extra.money = self.ability.extra_value
            end
            if context.selling_self and not G.GAME.blind.boss then
                if G.STATE ~= G.STATES.SELECTING_HAND then
                    return
                end
                G.GAME.current_round.hands_left = 0
                G.GAME.chips = G.GAME.blind.chips
                G.STATE = G.STATES.HAND_PLAYED
                G.STATE_COMPLETE = true
                end_round()
            end
        end
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