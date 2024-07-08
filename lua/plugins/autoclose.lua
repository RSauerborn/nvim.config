return {
    "m4xshen/autoclose.nvim",
    config = function()
        require("autoclose").setup({
            options = {
                disabled_filetypes = { },
                disable_command_mode = true
            },
        })
    end
}
