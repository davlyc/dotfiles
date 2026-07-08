return {
  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
      -- THE PALETTE HACK: Mapping your screenshot dots exactly
      local colors = {
        base00 = "#050505", -- Background (Match your Kitty)
        base01 = "#1a1a1a", -- Lighter background (Status bar)
        base02 = "#262626", -- Selection background
        base03 = "#4d4d4d", -- Comments (The grey dot)
        base04 = "#f8d2a6", -- Variables (Peach dot)
        base05 = "#f8d2a6", -- Default Text (Peach dot)
        base06 = "#ff8c00", -- Keywords (Orange dot)
        base07 = "#ffffff", -- Cursor (White dot)
        base08 = "#ff757f", -- Functions (Coral dot)
        base09 = "#ff8c00", -- Constants (Orange dot)
        base0A = "#f8d2a6", -- Classes
        base0B = "#73daca", -- Strings (Mint dot)
        base0C = "#73daca", -- Support
        base0D = "#ff8c00", -- Operators
        base0E = "#ff757f", -- Regex
        base0F = "#ff757f", -- Integers
      }

      require("base16-colorscheme").setup(colors)

      -- Force transparent backgrounds for that "Floating" look
      vim.api.nvim_set_hl(0, "Normal", { fg = colors.base05, bg = "NONE" })
      vim.api.nvim_set_hl(0, "NonText", { fg = colors.base03, bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { fg = colors.base03 })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a1a1a" })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- We leave this empty because base16 loads itself in the config function above
      colorscheme = function() end,
    },
  },
}
