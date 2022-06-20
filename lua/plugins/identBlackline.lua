
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {

  show_end_of_line = true,
  show_current_context = true,
  show_current_context_start = true,
}

vim.g.indent_blankline_filetype_exclude = {
  "help",
  "terminal",
  "dashboard",
  "packer",
  "lsp-installer",
  "lspinfo",
  "vista_kind",
}
vim.g.indent_blankline_buftype_exclude = { "terminal" }
