return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "angular", "arduino", "asm", "c", "c_sharp", "cmake", "cpp", "css", "csv", "cue", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "html", "javascript", "json", "json5", "latex", "lua", "make", "rust", "scss", "sql", "typescript", "vim", "xml", "yaml" },
            sync_install = false,
            auto_install = false,
            highlight = { enable = true },
            additional_vim_regex_highlighting = false,
            indent = { enable = true },
            disable = function(lang, buf)
                local max_filesize = 5000 * 1024 -- 5 MiB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end
        })
    end
}
