local tiny_code_action = require("tiny-code-action")

tiny_code_action.setup({
  backend = "vim",
})

vim.keymap.set('n', '<space>ca', function ()
  tiny_code_action.code_action()
end, { desc = 'Elige la acción de código' })
