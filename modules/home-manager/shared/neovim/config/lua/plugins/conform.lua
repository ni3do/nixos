return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      nix = { "nixfmt" },
      tex = { "tex-fmt" },
    },
    formatters = {
      ["tex-fmt"] = { -- Use brackets here
        append_args = { "--wraplen", "120" },
      },
    },
  },
}
