return {
  { "rebelot/kanagawa.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "RRethy/base16-nvim",
    config = function()
      require('base16-colorscheme').setup({
        base00 = "#27292D",
        base01 = "#D44C6D",
        base02 = "#30BA6F",
        base03 = "#D0E460",
        base04 = "#7D57F8",
        base05 = "#EB60D5",
        base06 = "#01D6D4",
        base07 = "#BDBDBD",
        base08 = "#4B4B4B",
        base09 = "#FC5D85",
        base0A = "#00D686",
        base0B = "#E8FD70",
        base0C = "#9978FE",
        base0D = "#FC7BE9",
        base0E = "#00FDFD",
        base0F = "#E5E5E5",
      })
    end
  }
}
