return
{
    'lervag/vimtex',
    config = function()
        vim.keymap.set('n', '<C-b>', ":up <bar> !pdflatex %:t<CR>")
    end
}
