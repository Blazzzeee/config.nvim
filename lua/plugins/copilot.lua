return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      vim.env.PATH = "/usr/bin:/bin:/usr/local/bin"
      require("copilot").setup({
        panel = { enabled = true },
        suggestion = { enabled = false },
        filetypes = {
          markdown = true,
          help = false,
        },

        -- ✅ Correct structure
        server_opts_overrides = {
          settings = {
            advanced = {
              node_command = "/usr/bin/node", -- must be inside settings.advanced
            },
          },
        },
      })
    end,
  },
}
