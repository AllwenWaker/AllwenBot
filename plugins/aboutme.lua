local function do_keyboard_aboutus()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Bots 🎈', callback_data = '!owners'},
			},
			{
			{text = 'Channels 😎', callback_data = '!members'},
			},
			{
			{text = 'Friends 👤', callback_data = '!friends'},
			},
			{
	    {text = '🔙', callback_data = '!home'},
	    }
    }
    return keyboard
end
local function do_keyboard_owners()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '● Element ●', url = 'http://telegram.me/ElementTG'},},
			{{text = '● Intelligent ●', url = 'http://telegram.me/IntelligentTG'},},
			{{text = '🔙 Back To Menu 🔙', callback_data = '!aboutus'},
	    }
    }
    return keyboard
end
local function do_keyboard_members()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
			{text = '● PluginsShop ●' , url = 'telegram.me/PluginsShop'},
			{
	    {text = '🔙 Back To Menu 🔙', callback_data = '!aboutus'},
        }
    }
    return keyboard
end
local function do_keyboard_friends()
    local keyboard = {}
    keyboard.inline_keyboard = {
	        {
			{text = '● Ali ●', url = 'telegram.me/ShopBuy'},
			},
			{
			{text = '● Parsa ●', url = 'telegram.me/ParsaAlemi'},
			{text = '● Arsalan ●' , url = 'telegram.me/mute_all'},
			},
			{
						{text = '● Ramin ●', url = 'telegram.me/Valtman'},
},
			{
	    {text = '🔙 Back To Menu 🔙', callback_data = '!aboutus'},
        }
    }
    return keyboard
end
local action = function(msg,blocks)
local msg_id = msg.message_id
local chat = msg.chat.id
local query = blocks[1]
    if msg.cb then
	if query == 'aboutus' then
		local keyboard = do_keyboard_aboutus()
		local text = [[_Please select an option ..._]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	if query == 'owners' then
		local keyboard = do_keyboard_owners()
		local text = [[*My Bots 🤓 :*]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	if query == 'members' then
		local keyboard = do_keyboard_members()
		local text = [[*My Channels 👥 :*]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	if query == 'friends' then
		local keyboard = do_keyboard_friends()
		local text = [[*My Friends 🌹 :*]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	end
	end
return {
  action = action,
triggers = {
	    '^###cb:!(aboutus)',
	    '^###cb:!(owners)',
	    '^###cb:!(members)',
	    '^###cb:!(friends)',
    }
}
