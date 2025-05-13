return {
  {
    "https://github.com/sphamba/smear-cursor.nvim",
    config = function()
      require("smear_cursor").setup({
        stiffness = 0.8,
        trailing_stiffness = 0.5,
        distance_stop_animating = 0.5
      })
      vim.keymap.set("n", "<leader>gf", function()
        require("smear_cursor").setup({
          cursor_color = "#ff8800",
          stiffness = 0.3,
          trailing_stiffness = 0.1,
          trailing_exponent = 5,
          never_draw_over_target = true,
          hide_target_hack = true,
          gamma = 1,
        })
      end)
      vim.keymap.set("n", "<leader>gr", function()
        require("smear_cursor").setup({
          stiffness = 0.8,
          trailing_stiffness = 0.5,
          distance_stop_animating = 0.5
        })
      end)
    end
  }
}
