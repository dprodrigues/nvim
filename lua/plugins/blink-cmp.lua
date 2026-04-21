return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",

     ['<C-j>'] = { 'select_next', 'fallback' },
     ['<C-k>'] = { 'select_prev', 'fallback' },
     ['<CR>'] = { 'select_and_accept', 'fallback' },
     ['<Tab>'] = { 'select_and_accept', 'fallback' },
    },

    appearance = {
      nerd_font_variant = "mono"
    },

    signature = {
      window = { border = 'single' }
    },

    completion = {
      menu = { border = 'single' },

      documentation = {
        auto_show = true,
        window = { border = 'single' }
      }
    },

    sources = {
      default = { "lsp", 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" }
}
