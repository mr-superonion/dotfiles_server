" telescope
" lua setups
lua require("tele")
" Find files using Telescope command-line sugar.
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fv <cmd>Telescope current_buffer_fuzzy_find<cr>
" Using Lua functions
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
