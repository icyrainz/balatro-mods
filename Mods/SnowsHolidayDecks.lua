--- STEAMODDED HEADER
--- MOD_NAME: Snow's Holiday Decks
--- MOD_ID: SnowHolidayDecks
--- MOD_AUTHOR: [RattlingSnow353]
--- MOD_DESCRIPTION: This mod adds a varity of decks to the game. 
--- BADGE_COLOUR: 60efff
--- DISPLAY_NAME: Snow's Mods

----------------------------------------------
------------MOD CODE -------------------------

function SMODS.INIT.SnowHolidayDecks()

    local snowHolidayDecks = SMODS.findModByID('SnowHolidayDecks')
    local snowDecks = SMODS.Sprite:new("SnowDecks", snowHolidayDecks.path, "SnowDecks.png", 71, 95, "asset_atli")
    snowDecks:register()

    local SnowsDecks_def = {

        Dawn = {
            ["name"] = "Dawn Deck",
            ["text"] = {
                [1] = "{C:attention}Retrigger{} last played hand {C:mult}twice{},",
               [2] = "{C:chips}-1{} hand per round",  
            },
        },
    }

    -- Initialize deck effect
    local Backapply_to_runRef = Back.apply_to_run
    function Back.apply_to_run(arg_56_0)
        Backapply_to_runRef(arg_56_0)

        if arg_56_0.effect.config.DawnDeck then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1 
                    G.GAME.round_resets.hands = G.GAME.starting_params.hands
                    G.GAME.current_round.hands_left = G.GAME.starting_params.hands

                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_dawn_deck', nil)
                    card:set_edition({
                        negative = true
                    })
                    card.ability.eternal = true
                    card:add_to_deck()
                    G.jokers:emplace(card)

                    -- Add effect to starting params
                    G.GAME.starting_params.DawnDeck = true

                    return true
                end
            }))
        end
    end

    local DawnDeck = SMODS.Deck:new("Dawn Deck", "ch_dawn", {DawnDeck = true, atlas = "SnowDecks"}, {x = 0, y = 0}, SnowsDecks_def.Dawn)
    DawnDeck:register()

end

----------------------------------------------
------------MOD CODE END---------------------