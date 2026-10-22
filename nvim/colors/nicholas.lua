vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "nicholas"

local palette = {
  bg = "#000000",
  blue = "#9FAAFF",
  orange = "#FF3939",
  red = "#FF173A",
  green = "#64E369",
  pink = "#A7A5FF",
  yellow = "#EDF7B5",
  ash = "#9C3C3C",
  dark_blue = "#8E94F2",
  cyan = "#2E9599",
  fg = "#FFE9E9",
  fg1 = "#BDF1FF",
  fg2 = "#C9C1E2",
  dim = "#191019",
  selection = "#3B3F91",
  highlight = "#3A463B",
  string_bg = "#071E03",
  keyword_bg = "#1F0303",
}

local set = vim.api.nvim_set_hl

-- Editor UI
set(0, "Normal", { fg = palette.fg, bg = palette.bg })
set(0, "NormalNC", { fg = palette.fg, bg = palette.bg })
set(0, "NormalFloat", { fg = palette.fg, bg = palette.bg })
set(0, "FloatBorder", { fg = palette.blue, bg = palette.bg })
set(0, "EndOfBuffer", { fg = palette.bg, bg = palette.bg })
set(0, "SignColumn", { fg = palette.ash, bg = palette.bg })
set(0, "FoldColumn", { fg = palette.ash, bg = palette.bg })
set(0, "Folded", { fg = palette.fg2, bg = palette.bg })
set(0, "LineNr", { fg = palette.ash, bg = palette.bg })
set(0, "CursorLineNr", { fg = palette.fg, bg = palette.bg, bold = true })
set(0, "CursorLine", { bg = palette.bg })
set(0, "ColorColumn", { bg = palette.bg })
set(0, "WinSeparator", { fg = palette.dim, bg = palette.bg })
set(0, "Whitespace", { fg = palette.dim })
set(0, "IblIndent", { fg = palette.dim })
set(0, "IblScope", { fg = palette.fg2 })

set(0, "NormalCursor", { fg = palette.bg, bg = "#DDDDE6" })
set(0, "InsertCursor", { fg = palette.bg, bg = palette.red })
set(0, "SelectCursor", { fg = palette.bg, bg = palette.blue })
set(0, "Visual", { bg = palette.selection })
set(0, "MatchParen", { fg = palette.bg, bg = "#C6C3D5" })
set(0, "Search", { fg = palette.fg, bg = palette.highlight })
set(0, "IncSearch", { fg = palette.bg, bg = palette.orange, bold = true })
set(0, "CurSearch", { link = "IncSearch" })

set(0, "StatusLine", { fg = palette.fg, bg = palette.bg })
set(0, "StatusLineNC", { fg = palette.dark_blue, bg = palette.bg })
set(0, "TabLine", { fg = palette.fg2, bg = palette.bg })
set(0, "TabLineSel", { fg = palette.red, bg = palette.bg, bold = true })
set(0, "TabLineFill", { bg = palette.bg })
set(0, "Pmenu", { fg = palette.fg, bg = palette.bg })
set(0, "PmenuSel", { fg = "#0F1110", bg = palette.dark_blue })
set(0, "PmenuSbar", { bg = palette.bg })
set(0, "PmenuThumb", { bg = palette.dark_blue })
set(0, "WildMenu", { fg = "#0F1110", bg = palette.dark_blue })

set(0, "Directory", { fg = palette.blue })
set(0, "Title", { fg = palette.red, bold = true })
set(0, "Question", { fg = palette.fg })
set(0, "MoreMsg", { fg = palette.fg })
set(0, "WarningMsg", { fg = palette.yellow })
set(0, "ErrorMsg", { fg = palette.red })

-- Diagnostics
set(0, "DiagnosticError", { fg = palette.red })
set(0, "DiagnosticWarn", { fg = palette.yellow })
set(0, "DiagnosticInfo", { fg = palette.fg })
set(0, "DiagnosticHint", { fg = palette.cyan })
set(0, "DiagnosticUnderlineError", { undercurl = true, sp = palette.red })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = palette.yellow })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = palette.fg })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = palette.cyan })

-- Syntax
set(0, "Comment", { fg = "#1F5F0B" })
set(0, "Constant", { fg = palette.pink, bold = true })
set(0, "String", { fg = palette.fg, bg = palette.string_bg })
set(0, "Character", { link = "String" })
set(0, "Number", { fg = palette.orange })
set(0, "Boolean", { fg = palette.pink })
set(0, "Float", { fg = palette.orange })
set(0, "Identifier", { fg = palette.fg })
set(0, "Function", { fg = palette.blue, bold = true })
set(0, "Statement", { fg = palette.fg, bg = palette.keyword_bg, bold = true })
set(0, "Operator", { fg = palette.fg2 })
set(0, "PreProc", { fg = palette.red })
set(0, "Type", { fg = palette.red })
set(0, "Special", { fg = palette.fg1 })
set(0, "Delimiter", { fg = palette.fg2 })
set(0, "Underlined", { fg = palette.blue, underline = true })
set(0, "Todo", { fg = palette.bg, bg = palette.yellow, bold = true })

-- Tree-sitter
set(0, "@attribute", { fg = palette.red })
set(0, "@type", { fg = palette.red })
set(0, "@type.builtin", { fg = palette.red })
set(0, "@type.parameter", { fg = palette.red })
set(0, "@type.enum", { fg = palette.red })
set(0, "@type.enum.variant", { fg = palette.red })
set(0, "@constructor", { fg = palette.fg })
set(0, "@constant", { fg = palette.pink, bold = true })
set(0, "@constant.builtin", { fg = palette.pink })
set(0, "@constant.builtin.boolean", { fg = palette.pink })
set(0, "@constant.numeric", { fg = palette.orange })
set(0, "@number", { fg = palette.orange })
set(0, "@string", { fg = palette.fg, bg = palette.string_bg })
set(0, "@comment", { fg = "#1F5F0B" })
set(0, "@variable", { fg = palette.fg })
set(0, "@variable.parameter", { fg = palette.fg })
set(0, "@variable.member", { fg = palette.fg1 })
set(0, "@variable.member.private", { fg = palette.fg1 })
set(0, "@label", { fg = palette.fg })
set(0, "@punctuation", { fg = palette.fg2 })
set(0, "@keyword", { fg = palette.fg, bg = palette.keyword_bg, bold = true })
set(0, "@keyword.storage", { fg = palette.fg1, bg = palette.keyword_bg, bold = true })
set(0, "@operator", { fg = palette.fg2 })
set(0, "@function", { fg = palette.blue, bold = true })
set(0, "@function.builtin", { fg = palette.blue, bold = true })
set(0, "@tag", { fg = palette.fg1 })
set(0, "@module", { fg = palette.fg1 })
set(0, "@namespace", { fg = palette.fg1 })
set(0, "@special", { fg = palette.fg1 })

-- Markup and diffs
set(0, "@markup.heading", { fg = palette.blue, bold = true })
set(0, "@markup.list", { fg = palette.fg2 })
set(0, "@markup.strong", { fg = palette.pink, bold = true })
set(0, "@markup.italic", { fg = palette.pink })
set(0, "@markup.link", { fg = palette.blue, underline = true })
set(0, "@markup.quote", { fg = palette.ash })
set(0, "@markup.raw", { fg = palette.fg1 })
set(0, "DiffAdd", { fg = palette.green, bg = palette.bg })
set(0, "DiffDelete", { fg = palette.red, bg = palette.bg })
set(0, "DiffChange", { fg = palette.yellow, bg = palette.bg })
set(0, "DiffText", { fg = palette.bg, bg = palette.blue, bold = true })

-- Common plugin surfaces
set(0, "TelescopeNormal", { fg = palette.fg, bg = palette.bg })
set(0, "TelescopeBorder", { fg = palette.blue, bg = palette.bg })
set(0, "TelescopePromptNormal", { fg = palette.fg, bg = palette.bg })
set(0, "TelescopePromptBorder", { fg = palette.red, bg = palette.bg })
set(0, "TelescopeSelection", { bg = palette.selection })
set(0, "OilDir", { fg = palette.blue, bold = true })
