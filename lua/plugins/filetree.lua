-- return {
--   "stevearc/oil.nvim",
--   cmd = "Oil",
--   keys = {
--     { "-", function() require("oil").open() end, desc = "Open parent directory (Oil)" },
--   },
--   opts = {
--     default_file_explorer = true,
--     view_options = {
--       show_hidden = true,
--     },
--   },
--   dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
-- }
--
return {
  "mikavilpas/yazi.nvim",
  dependencies = { "folke/snacks.nvim" },
  keys = {
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
