return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = false },
      dashboard = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      picker = {
        enabled = true,
        layout = {
          preset = "telescope",
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = "solid",
              title = "{title} {live} {flags}",
              { win = "list",  border = "none" },
              { win = "input", height = 1,     border = "top" },
            },
            { win = "preview", title = "{preview}", border = "solid", width = 0.5 },
          },
        }
      },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
    keys = {
      { "<leader>pf", function() Snacks.picker.files() end },
      { "<leader>pg", function() Snacks.picker.grep() end },
      { "<leader>sh", function() Snacks.picker.help() end },
      { "<leader>pr", function() Snacks.picker.resume() end },
    }
  },
  { "rktjmp/shipwright.nvim"
  },
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    { dir = '/home/sowsanti/.config/nvim/lushgrapemax', lazy = true },
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    opts = true
  },
  { "lifepillar/vim-colortemplate" },
  { "mdedonno1337/disassemble.nvim" }
}
