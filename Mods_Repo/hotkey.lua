--- STEAMODDED HEADER
--- MOD_NAME: Hotkeys
--- MOD_ID: akio_hotkeys
--- MOD_AUTHOR: [Akio]
--- MOD_DESCRIPTION: Hotkeys
----------------------------------------------
------------MOD CODE -------------------------
local keyupdate_ref = Controller.key_press_update
function Controller.key_press_update(self, key, dt)
	keyupdate_ref(self, key, dt)
	keys_to_ui = {
		["q"] = "sort_value",
		["w"] = "sort_rank",
		["z"] = "play_hand",
		["c"] = "discard_hand",
		["a"] = "unhighlight_all",
		["1"] = "next_card",
		["2"] = "prev_card",
		["tab"] = "click_card",
	}
	keys_to_popup_ui = {
		["i"] = "run_info",
		["b"] = "blinds_info",
		["h"] = "hands_info",
		["j"] = "jokers_info",
		["t"] = "tarots_info",
		["p"] = "planets_info",
		["l"] = "spectrals_info",
		["n"] = "next_round",
		["m"] = "reroll_shop",
		["f1"] = "select_blind",
		["f3"] = "cashout",
	}

	if tableContains(keys_to_popup_ui, key) then
		if keys_to_popup_ui[key] == "run_info" then
			local run_info_button = G.HUD:get_UIE_by_ID("run_info_button")
			if run_info_button.config.button == "run_info" then
				G.FUNCS.run_info()
			end
		elseif keys_to_popup_ui[key] == "blinds_info" then
			show_blinds_info()
		elseif keys_to_popup_ui[key] == "hands_info" then
			show_hands_info()
		elseif keys_to_popup_ui[key] == "jokers_info" then
			G.FUNCS.your_collection_jokers()
		elseif keys_to_popup_ui[key] == "tarots_info" then
			G.FUNCS.your_collection_tarots()
		elseif keys_to_popup_ui[key] == "planets_info" then
			G.FUNCS.your_collection_planets()
		elseif keys_to_popup_ui[key] == "spectrals_info" then
			G.FUNCS.your_collection_spectrals()
		elseif keys_to_popup_ui[key] == "next_round" then
			local button = G.shop:get_UIE_by_ID("next_round_button")
			if button ~= nil then
				button:click()
			end
		elseif keys_to_popup_ui[key] == "reroll_shop" then
			local button = G.shop:get_UIE_by_ID("reroll_shop")
			if button ~= nil then
				button:click()
			end
		elseif keys_to_popup_ui[key] == "select_blind" then
			local ui = G.blinds_select
			if not ui then
				return
			end -- Early exit if UI is nil

			local button = ui:get_UIE_by_ID("select_blind_button")
			if button then
				button:click() -- Click the button if it exists
			end
		end
	end

	if G.STATE == G.STATES.SELECTING_HAND then
		for i = #G.hand.cards, 1, -1 do
			G.hand.cards[i]:stop_hover()
		end
		-- if tableContains(keys_to_nums, key) then
		-- 	num = keys_to_nums[key]
		-- 	in_list = false
		-- 	if num <= #G.hand.cards then
		-- 		card = G.hand.cards[num]
		-- 		for i = #G.hand.highlighted, 1, -1 do
		-- 			if G.hand.highlighted[i] == card then
		-- 				in_list = true
		-- 				break
		-- 			end
		-- 		end
		-- 		if in_list then
		-- 			G.hand:remove_from_highlighted(card, false)
		-- 			play_sound("cardSlide2", nil, 0.3)
		-- 		else
		-- 			G.hand:add_to_highlighted(card)
		-- 		end
		-- 	end
		-- end
		if G.hand.current_card == nil then
			G.hand.current_card = #G.hand.cards
		end

		if tableContains(keys_to_ui, key) then
			if keys_to_ui[key] == "play_hand" then
				local play_button = G.buttons:get_UIE_by_ID("play_button")
				if play_button.config.button == "play_cards_from_highlighted" then
					G.FUNCS.play_cards_from_highlighted()
				end
			elseif keys_to_ui[key] == "discard_hand" then
				local discard_button = G.buttons:get_UIE_by_ID("discard_button")
				if discard_button.config.button == "discard_cards_from_highlighted" then
					G.FUNCS.discard_cards_from_highlighted()
				end
			elseif keys_to_ui[key] == "sort_value" then
				G.FUNCS.sort_hand_value()
			elseif keys_to_ui[key] == "sort_rank" then
				G.FUNCS.sort_hand_suit()
			elseif keys_to_ui[key] == "unhighlight_all" then
				G.hand:unhighlight_all()
			elseif keys_to_ui[key] == "next_card" then
				hover_next_card(1)
			elseif keys_to_ui[key] == "prev_card" then
				hover_next_card(-1)
			elseif keys_to_ui[key] == "click_card" then
				G.hand.cards[G.hand.current_card]:click()
			end
		end
	end
end

function hover_next_card(delta)
	G.hand.cards[G.hand.current_card]:stop_hover()
	local new_index = (G.hand.current_card - 1 + delta) % #G.hand.cards + 1
	if new_index == 0 then
		new_index = #G.hand.cards
	end
	G.hand.current_card = new_index
	G.hand.cards[G.hand.current_card]:hover()
end

function tableContains(table, key)
	for k, v in pairs(table) do
		if k == key then
			return true
		end
	end
	return false
end

function show_hands_info()
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu({
		definition = create_UIBox_generic_options({
			contents = {
				create_tabs({
					tabs = {
						{
							label = localize("b_poker_hands"),
							chosen = true,
							tab_definition_function = create_UIBox_current_hands,
						},
					},
					tab_h = 8,
					snap_to_nav = true,
				}),
			},
		}),
	})
end

function show_blinds_info()
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu({
		definition = create_UIBox_generic_options({
			contents = {
				create_tabs({
					tabs = {
						{
							label = localize("b_blinds"),
							chosen = true,
							tab_definition_function = G.UIDEF.current_blinds,
						},
					},
					tab_h = 8,
					snap_to_nav = true,
				}),
			},
		}),
	})
end

----------------------------------------------
------------MOD CODE END----------------------
