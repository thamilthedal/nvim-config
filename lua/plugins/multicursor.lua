return
{
    'terryma/vim-multiple-cursors',
    config = function()
        vim.keymap.set('n', '<C-n>', "multi_cursor_start_word_key()<CR>")
        vim.keymap.set('n', '<A-n>', "multi_cursor_select_all_word_key()<CR>")
        vim.keymap.set('n', 'g<C-n>', "multi_cursor_start_key()<CR>")
        vim.keymap.set('n', 'g<A-n>', "multi_cursor_select_all_key()<CR>")
        vim.keymap.set('n', '<C-n>', "multi_cursor_next_key()<CR>")
        vim.keymap.set('n', '<C-p>', "multi_cursor_prev_key()<CR>")
        vim.keymap.set('n', '<C-x>', "multi_cursor_skip_key()<CR>")
        vim.keymap.set('n', '<Esc>', "multi_cursor_quit_key()<CR>")
    end
}

