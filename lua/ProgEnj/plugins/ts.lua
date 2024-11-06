return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {"c", "lua", "c_sharp", "javascript", "css", "html", "json", "zig", },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true,
            },
        })
    end
}
