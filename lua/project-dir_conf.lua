vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local git_dir = vim.fn.finddir(".git", ".;")
    if git_dir ~= "" then
      vim.cmd("lcd " .. vim.fn.fnamemodify(git_dir, ":h"))
    else
      vim.cmd("lcd %:p:h")
    end
  end
})

