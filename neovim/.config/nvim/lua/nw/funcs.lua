-- Czech keymap
function toggle_keymap()
    if vim.bo.keymap == 'czech_utf-8' then
        print('Using English keymap')
        vim.bo.keymap = ''
    else
        print('Using Czech keymap')
        vim.bo.keymap = 'czech_utf-8'
    end
end
vim.cmd('command ToggleKeymap :lua toggle_keymap()')
