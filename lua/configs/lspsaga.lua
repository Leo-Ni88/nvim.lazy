local status, lspsaga = pcall(require, "lspsaga")
if not status then
    return
end

lspsaga.setup({
    lightbulb = {
        enable = false,
    },
    outline = {
        keys = {
            expand_or_jump = "<CR>",
        },
    },
    callhierarchy = {
        keys = {
            expand_collapse = "<CR>",
        },
    },
    finder = {
        keys = {
            jump_to = 'o',
            expand_or_jump = '<CR>',
        },
    },
})
