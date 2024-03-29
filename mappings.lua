-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    ["H"] = { "^", desc = "Move cursor to the start of line" },
    ["L"] = { "$", desc = "Move cursor to the end of line" },
    ["K"] = { "<C-b>M", desc = "Page up" },
    ["J"] = { "<C-f>M", desc = "Page down" },

    ["gh"] = { "<cmd>wincmd h<cr>", desc = "Normal left window navigation" },
    ["gj"] = { "<cmd>wincmd j<cr>", desc = "Normal down window navigation" },
    ["gk"] = { "<cmd>wincmd k<cr>", desc = "Normal up window navigation" },
    ["gl"] = { "<cmd>wincmd l<cr>", desc = "Normal right window navigation" },

    ["+"] = { "J", desc = "Connect lines" },
    ["U"] = { "<C-r>", desc = "Redo" },

    ["<leader>mv"] = { ":MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["gh"] = { "<cmd>wincmd h<cr>", desc = "Terminal left window navigation" },
    ["gj"] = { "<cmd>wincmd j<cr>", desc = "Terminal down window navigation" },
    ["gk"] = { "<cmd>wincmd k<cr>", desc = "Terminal up window navigation" },
    ["gl"] = { "<cmd>wincmd l<cr>", desc = "Terminal right window navigation" },
  },
  v = {
    ["H"] = { "^", desc = "Move cursor to the start of line" },
    ["L"] = { "$", desc = "Move cursor to the end of line" },
    ["K"] = { "<C-b>M", desc = "Page up" },
    ["J"] = { "<C-f>M", desc = "Page down" },
    ["<leader>mf"] = {":'<,'>!pandoc -t commonmark_x<cr><cr>" },
  }
}
