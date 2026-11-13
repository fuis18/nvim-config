vim.opt.spelllang = { "en", "es", "de", "cjk" }

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"

vim.opt.wrap = true
vim.opt.linebreak = true

vim.g.trouble_lualine = false

-- Desactiva los mappings heredados del ftplugin sql de Vim (<Left>/<Right> en
-- insert y los atajos <C-C>*) que llaman a sqlcomplete#*, funciones que nunca
-- se definen porque el extra lang.sql pone loaded_sql_completion=true
-- (sqlcomplete.vim hace finish en su guard) → E117: Unknown function:
-- sqlcomplete#DrillOutOfColumns al moverse con las flechas en modo insert.
vim.g.omni_sql_no_default_maps = 1
