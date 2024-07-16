vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)

vim.keymap.set('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>p', '\"_dP')

vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

vim.keymap.set('v', 'J', ':m \'>+9<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<6<CR>gv=gv')
vim.keymap.set('n', '<C-f>', '/')
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<C-a>', 'ggVG')
vim.keymap.set('n', '<leader><Tab>', 'ggVG=')
--vim.api.nvim_set_keymap('n', '<Tab>', '>>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
