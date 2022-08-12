local M = {}


function M.get_sections()
	local header = {
		type = "text",
		val = {
			[[  ]],
			[[  ]],
			[[  ]],
			[[	 ██ ▄█▀▄▄▄       ██▓     ██▓ ███▄ ▄███▓ ▄▄▄       ██▓     ██▓      ]],
			[[	 ██▄█▒▒████▄    ▓██▒    ▓██▒▓██▒▀█▀ ██▒▒████▄    ▓██▒    ▓██▒      ]],
			[[	▓███▄░▒██  ▀█▄  ▒██░    ▒██▒▓██    ▓██░▒██  ▀█▄  ▒██░    ▒██▒      ]],
			[[	▓██ █▄░██▄▄▄▄██ ▒██░    ░██░▒██    ▒██ ░██▄▄▄▄██ ▒██░    ░██░      ]],
			[[	▒██▒ █▄▓█   ▓██▒░██████▒░██░▒██▒   ░██▒ ▓█   ▓██▒░██████▒░██░      ]],
			[[	▒ ▒▒ ▓▒▒▒   ▓▒█░░ ▒░▓  ░░▓  ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░▓  ░░▓        ]],
			[[	░ ░▒ ▒░ ▒   ▒▒ ░░ ░ ▒  ░ ▒ ░░  ░      ░  ▒   ▒▒ ░░ ░ ▒  ░ ▒ ░      ]],
			[[	░ ░░ ░  ░   ▒     ░ ░    ▒ ░░      ░     ░   ▒     ░ ░    ▒ ░      ]],
			[[	░  ░        ░  ░    ░  ░ ░         ░         ░  ░    ░  ░ ░        ]],
			[[  ]],
			[[  ]],
			[[  ]],
			[[  ]],
			[[  ]],
			[[  ]],
			[[  ]],
		},
		opts = {
			position = "center",
			hl = "Label",
		},
	}

	local text = require("kalimali.dashboard.utils")

	local footer_text = {" ", " ", " ", " ", " "}
	for _,v in ipairs(require('alpha.fortune')()) do
		table.insert(footer_text, v)
	end  -- Hacky way to add padding

	local footer = {
		type = "text",
		val = text.align_center({ width = 0 }, footer_text, 0.5),
		opts = {
			position = "center",
			hl = "Number",
		},
	}

	local buttons = {
		entries = {
			-- { "l", "  Recently latest session", ":SessionLoad <CR>" },
			{ "s", "  Sessions", ":lua require('kalimali.telescope').search_sessions() <CR>" },
			{ "f", "  Find file", ":Telescope find_files <CR>" },
			{ "e", "  New file", ":enew <BAR> startinsert <CR>" },
			-- { "p", "  Find project", ":Telescope projects <CR>" },
			{ "r", "  Recently used files", ":Telescope oldfiles <CR>" },
			{ "t", "  Find text", ":Telescope live_grep <CR>" },
			{ "u", "ﮮ  Update Plugins", ":PackerUpdate<CR>" },
			{ "c", "  Configuration", ":lua require('kalimali.dashboard.utils').open_config() <CR>" },
			{ "q", "  Quit Neovim", ":qa<CR>" },
		},
	}

	return {
		header = header,
		buttons = buttons,
		footer = footer,
	}
end

M.config = {}

return M
