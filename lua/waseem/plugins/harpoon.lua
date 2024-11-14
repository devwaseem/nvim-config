return {
    "ThePrimeagen/harpoon",
    keys = {
        {
            "<leader>m",
            function()
                require("harpoon.mark").add_file()
            end,
            desc = "Mark file in Harpoon"
        },
        {
            "<leader>h",
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            desc = "Toggle Harpoon quick menu"
        },
        {
            "<S-l>",
            function()
                require("harpoon.ui").nav_next()
            end,
            desc = "Next buffer"
        },
        {
            "<S-h>",
            function()
                require("harpoon.ui").nav_prev()
            end,
            desc = "Previous buffer"
        },
        {
            "<leader>1",
            function()
                require("harpoon.ui").nav_file(1)
            end,
            desc = "Goto Harpoon Buffer 1"
        },
        {
            "<leader>2",
            function()
                require("harpoon.ui").nav_file(2)
            end,
            desc = "Goto Harpoon Buffer 2"
        },
        {
            "<leader>3",
            function()
                require("harpoon.ui").nav_file(3)
            end,
            desc = "Goto Harpoon Buffer 3"
        },
        {
            "<leader>4",
            function()
                require("harpoon.ui").nav_file(4)
            end,
            desc = "Goto Harpoon Buffer 4"
        },
        {
            "<leader>5",
            function()
                require("harpoon.ui").nav_file(5)
            end,
            desc = "Goto Harpoon Buffer 5"
        },
        {
            "<leader>6",
            function()
                require("harpoon.ui").nav_file(6)
            end,
            desc = "Goto Harpoon Buffer 6"
        },


    }
}
