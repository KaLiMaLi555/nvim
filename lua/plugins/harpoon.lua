return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require('harpoon')
		harpoon:setup({})

		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = "Open harpoon window" })
		vim.keymap.set("n", "<localleader>h", function() harpoon:list():add() end)

		vim.keymap.set("n", "<localleader>a", function() harpoon:list():select(1) end)
		vim.keymap.set("n", "<localleader>s", function() harpoon:list():select(2) end)
		vim.keymap.set("n", "<localleader>d", function() harpoon:list():select(3) end)
		vim.keymap.set("n", "<localleader>f", function() harpoon:list():select(4) end)
	end
}
