--------------------------
-- Bootstrapping lazy.nvim
--------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------
-- 基本設定
--------------------------
-- 文字エンコーディング（Neovimでは内部的にutf-8になっています）
vim.o.encoding = "utf-8"
vim.scriptencoding = "utf-8"

-- leaderキーの設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------
-- Plugin 管理（lazy.nvim）
--------------------------
require("lazy").setup({
  -- カラースキーム
  { "cocopon/iceberg.vim" },
  -- コメントON/OFFプラグイン（caw.vim）
  { "tyru/caw.vim" },
  -- 自動で括弧補完（lexima.vim）
  { "cohama/lexima.vim" },
  -- Unite 関連プラグイン
  { "Shougo/unite.vim" },
  -- VimFiler
  { "Shougo/vimfiler" },
})

--------------------------
-- Unite 関連設定
--------------------------
-- Unite をバッファ一覧表示用に起動するマッピング
vim.keymap.set("n", "<leader>b", ":<C-u>Unite buffer -buffer-name=file<CR>", { noremap = true })

-- Unite 起動時のバッファ内マッピング（ESCで終了するために "l" キーを ENTER に）
function _G.unite_my_settings()
  vim.api.nvim_buf_set_keymap(0, "n", "l", "<CR>", { noremap = true })
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "unite",
  callback = function(args)
    _G.unite_my_settings()
  end,
})

--------------------------
-- VimFiler 関連設定
--------------------------
-- vimデフォルトのエクスプローラを VimFiler に置き換える
vim.g.vimfiler_as_default_explorer = 1
-- セーフモードを無効
vim.g.vimfiler_safe_mode_by_default = 0

-- VimFiler 起動時のキーマッピング
function _G.vimfiler_my_settings()
  vim.api.nvim_buf_set_keymap(0, "n", "q", "<Plug>(vimfiler_exit)", { silent = true })
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vimfiler",
  callback = function(args)
    _G.vimfiler_my_settings()
  end,
})

-- 現在開いているバッファのディレクトリを VimFiler で表示
vim.keymap.set("n", "<leader>e", ":<C-u>VimFilerBufferDir -quit<CR>", { silent = true })
-- バッファをIDE風に表示（横分割：ウィンドウ幅35）
vim.keymap.set("n", "<leader>tr", ":<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>", { silent = true })

--------------------------
-- カラースキーム設定
--------------------------
vim.cmd([[colorscheme iceberg]])
vim.cmd([[hi Normal ctermbg=NONE ctermfg=252 guibg=NONE guifg=#c6c8d1]])
vim.cmd([[highlight CursorLine ctermbg=239]])
vim.cmd([[highlight CursorColumn ctermbg=239]])

--------------------------
-- 一般設定
--------------------------

vim.wo.number = true

vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.showcmd = true

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.wildmode = "list:longest"

vim.opt.list = true
vim.opt.listchars = "tab:▸-"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.clipboard = "unnamedplus"

--------------------------
-- キーバインド設定
--------------------------
-- ESCキー2回でハイライトを切替
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch!<CR>", { silent = true })

-- 折返し行の移動
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("v", "k", "gk", { noremap = true })
vim.keymap.set("v", "j", "gj", { noremap = true })
vim.keymap.set("n", "gk", "k", { noremap = true })
vim.keymap.set("n", "gj", "j", { noremap = true })
vim.keymap.set("v", "gk", "k", { noremap = true })
vim.keymap.set("v", "gj", "j", { noremap = true })

-- { } 関連の入れ替えマッピング
vim.keymap.set("n", "K", "{", { noremap = true })
vim.keymap.set("n", "J", "}", { noremap = true })
vim.keymap.set("v", "J", "}", { noremap = true })
vim.keymap.set("v", "K", "{", { noremap = true })
vim.keymap.set("n", "{", "K", { noremap = true })
vim.keymap.set("n", "}", "J", { noremap = true })
vim.keymap.set("v", "}", "J", { noremap = true })
vim.keymap.set("v", "{", "K", { noremap = true })

-- 行頭・行末移動
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("v", "H", "^", { noremap = true })
vim.keymap.set("v", "L", "$", { noremap = true })

-- 画面分割関連
vim.keymap.set("n", "ss", ":<C-u>sp<CR>", { noremap = true })
vim.keymap.set("n", "sv", ":<C-u>vs<CR>", { noremap = true })
vim.keymap.set("n", "sj", "<C-w>j", { noremap = true })
vim.keymap.set("n", "sk", "<C-w>k", { noremap = true })
vim.keymap.set("n", "sl", "<C-w>l", { noremap = true })
vim.keymap.set("n", "sh", "<C-w>h", { noremap = true })

-- 危険なキーの無効化
vim.keymap.set("n", "ZZ", "<Nop>", { noremap = true })
vim.keymap.set("n", "ZQ", "<Nop>", { noremap = true })

-- v を2回押して行末まで選択
vim.keymap.set("v", "v", "$h", { noremap = true })

-- エラー一覧表示
vim.keymap.set("n", "<leader>?", ":lopen<CR>", { noremap = true })

--------------------------
-- VSCode 使用時の設定
--------------------------
if vim.g.vscode then
  -- VSCode extension 用の設定
  vim.opt.buftype = ""
  vim.keymap.set("n", "gs", ":<C-u>%s///g", { noremap = true })
  vim.keymap.set("v", "gs", ":s///g", { noremap = true })
  vim.keymap.set("n", "<leader>w", "<cmd>call VSCodeNotify('workbench.action.files.save')<cr>")
  vim.keymap.set("n", "<leader>q", "<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<cr>")
  vim.keymap.set("i", "jj", "<cmd>call VSCodeNotify('vscode-neovim.escape')<cr>", { silent = true })
  vim.keymap.set("n", "<C-h>", "<Nop>", { silent = true })
  vim.keymap.set("n", "<C-l>", "<Nop>", { silent = true })
  vim.keymap.set("n", "tt", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>")
  vim.keymap.set("n", "th", "<cmd>call VSCodeNotify('workbench.action.previousEditor')<cr>")
  vim.keymap.set("n", "tl", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<cr>")
  vim.keymap.set("n", "sv", "<cmd>call VSCodeNotify('workbench.action.splitEditor')<cr>")
  vim.keymap.set("n", "sh", "<cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<cr>")
  vim.keymap.set("n", "sl", "<cmd>call VSCodeNotify('workbench.action.focusRightGroup')<cr>")
  vim.keymap.set("n", "<leader>d", "<cmd>call VSCodeNotify('editor.action.revealDefinition')<cr>")
  vim.keymap.set("n", "<leader>i", "<cmd>call VSCodeNotify('editor.action.goToImplementation')<cr>")
  vim.keymap.set("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<cr>")
else
  -- 通常の Neovim 用設定
  vim.keymap.set("n", "gs", ":<C-u>%s///g<Left><Left><Left>", { noremap = true })
  vim.keymap.set("v", "gs", ":s///g<Left><Left><Left>", { noremap = true })
  vim.keymap.set("n", "<leader>w", ":<C-u>w<CR>", { noremap = true })
  vim.keymap.set("n", "<leader>q", ":<C-u>q<CR>", { noremap = true })
  vim.keymap.set("n", "<leader>Q", ":<C-u>q!<CR>", { noremap = true })
  vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
  vim.keymap.set("n", "tt", ":<C-u>tabe<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<C-h>", "gT", { noremap = true })
  vim.keymap.set("n", "<C-l>", "gt", { noremap = true })
  vim.keymap.set("n", "th", "gT", { noremap = true })
  vim.keymap.set("n", "tl", "gt", { noremap = true })
end

