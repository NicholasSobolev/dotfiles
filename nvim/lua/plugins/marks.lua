return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    -- You can set your options here
    builtin_marks = { "<", ">", "^" },
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
  },
}
