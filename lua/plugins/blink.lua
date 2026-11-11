return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            auto_insert = false,
            preselect = false,
          },
        },
      },
      keymap = {
        preset = "super-tab",
        ["<C-.>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_next()
            end
            return cmp.show()
          end,
        },
        ["<C-n>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_next()
            end
            return cmp.show()
          end,
        },
        ["<C-p>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            end
            return cmp.show()
          end,
        },
        -- Cadena propia: al definir <Tab>, LazyVim ya no inyecta ai_accept,
        -- así que se añade a mano. Prioridad: snippet → sugerencia de Copilot
        -- → ítem SELECCIONADO del menú (accept() no acepta sin selección,
        -- a diferencia de select_and_accept) → Tab normal.
        ["<Tab>"] = {
          function()
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" })()
          end,
          function(cmp)
            return cmp.accept()
          end,
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<CR>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.accept()
            end
          end,
          "fallback",
        },
        ["<Down>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_next()
            end
          end,
          "fallback",
        },
        ["<Up>"] = {
          function(cmp)
            if cmp.is_menu_visible() then
              return cmp.select_prev()
            end
          end,
          "fallback",
        },
        ["<C-e>"] = { "cancel", "fallback" },
      },
    },
  },
}
