-- Helpers a nivel de módulo para que las keys sean una tabla simple.
-- IMPORTANTE: no usar `keys = function()` que devuelva una tabla nueva —
-- lazy.nvim la llama con las teclas acumuladas de fragmentos anteriores y lo
-- que la función devuelva REEMPLAZA el acumulado (plugin.lua:458), borrando
-- las teclas de ui.lua (<leader>n Notification History y <leader>un Dismiss).
-- Las tablas simples se concatenan (handler/init.lua:106).
local function open_explorer(opts)
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer then
    explorer:focus()
  else
    Snacks.explorer(opts)
  end
end

local function close_explorer()
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer then
    explorer:close()
  end
end

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
        },
      },
    },
  },
  keys = {
    { "<leader>e", function() open_explorer({ cwd = LazyVim.root() }) end, desc = "Explorer Snacks (root dir)" },
    { "<leader>E", function() open_explorer({}) end, desc = "Explorer Snacks (cwd)" },
    { "<leader>ce", close_explorer, desc = "Close Explorer" },
  },
}
