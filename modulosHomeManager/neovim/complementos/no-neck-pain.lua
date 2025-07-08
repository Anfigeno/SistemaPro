local no_neck_pain = require("no-neck-pain")

vim.keymap.set("n", "<leader>nn", no_neck_pain.toggle, { desc = "Centrar ventana" })
