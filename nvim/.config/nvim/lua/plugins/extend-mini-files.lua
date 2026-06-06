return {
  "nvim-mini/mini.files",
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (directory of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(LazyVim.root(), true)
      end,
      desc = "Open mini.files (root)",
    },
  },

  opts = function(_, opts)
    opts = opts or {}

    opts.mappings = {
      go_in = "<Right>",
      go_out = "<Left>",
    }

    opts.windows = {
      width_nofocus = 20,
      width_focus = 50,
      width_preview = 100,
    }

    opts.options = {
      use_as_default_explorer = true,
    }

    -- 👇 Add filter correctly
    opts.content = opts.content or {}
    opts.content.filter = function(fs_entry)
      return not fs_entry.name:match("%.uid$")
    end

    return opts
  end,
}
