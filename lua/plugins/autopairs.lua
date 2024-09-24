return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        -- Call the autopairs setup function to configure how we want autopairs to work
        require'nvim-autopairs'.setup({})

        -- Get access to auto pairs completion and cmp plugins
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        -- Whenever we accept a choice from an autocompletion, make sure that any pairs are automatically closed
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
