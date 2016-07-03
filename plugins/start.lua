local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Share My Contact 🤖🤘🏾', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Buy Group 💸', callback_data = '!buygroup'},
    		    		{text = 'Support Intelligent 👥', url = 'https://telegram.me/joinchat/DakeQj7vR3XOOR3r5CLgAw'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_buygroup()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'Iranians', url = 'https://telegram.me/joinchat/DakeQj7vR3XOOR3r5CLgAw'},
    		    		{text = 'Other countries', url = 'https://telegram.me/joinchat/DakeQj7vR3XOOR3r5CLgAw'},
	    },
	    {
	    {text = '🔙', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🌐 Site', url = 'http://allwen.ir'},
    		{text = '📡 Groups', callback_data = '!channel'},
	    },
		{
	        {text = 'Chat 📲', callback_data = '/chat'},
        },
		{
	        {text = 'About Us 👥', callback_data = '!aboutus'},
        },
	    {
	        {text = 'About Bots🔹', callback_data = '!robot'},
        }
    }
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🙃👉 Click here ! 👈🙃', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end
local function do_keyboard_channel()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Join!', url = 'https://telegram.me/joinchat/DakeQj7vR3XOOR3r5CLgAw'},
	    },
	{
	        		{text = 'Join!', url = 'https://telegram.me/joinchat/DakeQj7vR3XOOR3r5CLgAw'},

    },
		{
					{text = 'Join!', url = 'https://telegram.me/joinchat/DakeQj7vR3XOOR3r5CLgAw'},
		},
		{
	    {text = '🔙', callback_data = '!home'},
        }
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[📍 *Welcome Allwen Official Bot*  📍
-------------------------------------------------------------
🗣 `Please select an option ...`]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, 'Hey 👋 Please `start` me in *PV* 🖐😄👇' ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'channel' then
            local text = '📡 *BeatBotTeam Channels :*'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[🔸*Intelligent*🔹
🚩 _An advanced robot for entertainment group manager and anti-spam_]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'buygroup' then
            local text = [[_Please wait after payment_ 
_We will be call to you_]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍 *Welcome Allwen Official Bot*  📍
-------------------------------------------------------------
🗣 `Please select an option ...`]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+989380386206', 'Allwen')
end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)@BeatBotTeamBot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:!(home)',
		'^###cb:!(buygroup)',
	    '^###cb:!(channel)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',

    }
}
