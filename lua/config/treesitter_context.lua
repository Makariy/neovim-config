
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 2,
      trim_scope = 'outer', 
      mode = 'cursor', 
    })
  end,
}


