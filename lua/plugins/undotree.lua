return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
        {
            "<localleader>u",
            "<cmd>lua require('undotree').toggle()<cr>",
            desc = "Toggle Undo Tree",
        },
    },
}
