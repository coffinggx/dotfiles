return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            local map = vim.keymap.set

            -- Add current file
            map("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon Add File" })

            -- Toggle quick menu
            map("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon Menu" })

            -- Jump to files
            map("n", "<leader>1", function() harpoon:list():select(1) end)
            map("n", "<leader>2", function() harpoon:list():select(2) end)
            map("n", "<leader>3", function() harpoon:list():select(3) end)
            map("n", "<leader>4", function() harpoon:list():select(4) end)

            -- Cycle through files
            map("n", "<C-S-P>", function()
                harpoon:list():prev()
            end, { desc = "Harpoon Previous" })

            map("n", "<C-S-N>", function()
                harpoon:list():next()
            end, { desc = "Harpoon Next" })
        end,
    },
}
