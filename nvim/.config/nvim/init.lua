vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.o.completeopt = "menuone,noinsert"

vim.cmd("set termguicolors")

if vim.g.neovide then
    vim.o.guifont = "JetBrains Mono:h16"
    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_position_animation_length = 0
end


vim.pack.add({
    "https://github.com/webhooked/kanso.nvim",
    "https://github.com/nvim-mini/mini.files",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.snippets",
    "https://github.com/nvim-mini/mini.completion",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/tpope/vim-sleuth",
    "https://github.com/mbbill/undotree",
})

vim.cmd.colorscheme("kanso-zen")

require("mini.icons").setup()
require("mini.files").setup()
vim.keymap.set("n", "-", MiniFiles.open)

local lsps = {
    "lua_ls",
    "tsgo",
    "cssls",
    "html",
    "emmet_language_server",
    "svelte",
}
for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end

require("lazydev").setup({
    library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    }
})

local MiniSnippets = require('mini.snippets')
local gen_loader = MiniSnippets.gen_loader
MiniSnippets.setup({
    snippets = { gen_loader.from_lang() }
})
MiniSnippets.start_lsp_server()

require("mini.completion").setup()

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)

        if not lang then
            return
        end

        local ts = require("nvim-treesitter")

        if vim.tbl_contains(ts.get_available(), lang) then
            if not vim.tbl_contains(ts.get_installed(), lang) then
                ts.install(lang)
            else
                vim.treesitter.start(args.buf)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        end
    end,
})


local clear = function ()
    vim.cmd("nohlsearch")
    MiniSnippets.session.stop()
end

vim.keymap.set("n", "<Esc>", clear)
vim.keymap.set("n", "<C-c>", clear)

vim.keymap.set("n", "<C-q>", "ZZ")
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

vim.keymap.set("n", "<C-S-x>", "<Cmd>bdelete<CR>")
vim.keymap.set("n", "<C-n>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<C-p>", "<Cmd>bprevious<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>ve", function()
    vim.diagnostic.open_float()
end)

vim.keymap.set("v", "<leader>r", function()
    vim.cmd('normal! "vy')

    local text = vim.fn.getreg("v")
    text = text:gsub("\\", "\\\\")
    text = text:gsub("/", "\\/")

    vim.api.nvim_feedkeys(":%s/\\V" .. text .. "//gc", "n", false)

    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes(string.rep("<Left>", 3), true, false, true),
        "n",
        false
    )
end)

vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR><Cmd>UndotreeFocus<CR>")

vim.keymap.set("n", "<leader>=", function()
    local view = vim.fn.winsaveview()
    vim.cmd("normal! gg=G")
    vim.fn.winrestview(view)
end)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
