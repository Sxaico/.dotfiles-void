require'obsidian'.setup{
    workspaces = {
    {
        name = "Segundo-Cerebro",
        path = "~/Documents/Segundo-Cerebro",
    },
    {
        name = "no-vault",
        path = function()
            -- alternatively use the CWD:
            -- return assert(vim.fn.getcwd())
            return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
        end,
        overrides = {
            notes_subdir = vim.NIL,  -- have to use 'vim.NIL' instead of 'nil'
            new_notes_location = "current_dir",
            templates = {
              subdir = vim.NIL,
            },
            disable_frontmatter = true,
        },
    },
    -- see below for full list of options 👇
    },
    -- completion = {
        -- nvim_cmp = true,
        -- min_chars = 2,
    -- },

    -- Optional, for templates (see below).
    -- templates = {
      -- subdir = "⚙Templates",
      -- date_format = "%Y-%m-%d",
      -- time_format = "%H:%M",
      -- -- A map for custom variables, the key should be the variable and the value a function
      -- substitutions = {},
    -- },

}

