-- Comandos globales de login de Copilot.
-- nvim-lspconfig crea :LspCopilotSignIn/SignOut buffer-local en on_attach
-- (lsp/copilot.lua), así que solo existen en buffers con el cliente adjunto
-- y fallan con "command not found" desde el dashboard u otros buffers.
-- Estos globales buscan el cliente en cualquier buffer; en buffers con el
-- comando buffer-local, este queda sombreado (mismo comportamiento).
local function get_client()
  local buf_clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
  if #buf_clients > 0 then
    return buf_clients[1]
  end
  return vim.lsp.get_clients({ name = "copilot" })[1]
end

local function sign_in()
  local client = get_client()
  if not client then
    vim.notify(
      "Copilot LSP no está adjunto: abre un archivo y reintenta en unos segundos.",
      vim.log.levels.WARN
    )
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  client:request(
    "signIn",
    vim.empty_dict(),
    function(err, result)
      if err then
        vim.notify(err.message, vim.log.levels.ERROR)
        return
      end
      if result.command then
        local code = result.userCode
        local command = result.command
        vim.fn.setreg("+", code)
        vim.fn.setreg("*", code)
        local continue = vim.fn.confirm(
          "Copied your one-time code to clipboard.\n" .. "Open the browser to complete the sign-in process?",
          "&Yes\n&No"
        )
        if continue == 1 then
          client:exec_cmd(command, { bufnr = bufnr }, function(cmd_err, cmd_result)
            if cmd_err then
              vim.notify(cmd_err.message, vim.log.levels.ERROR)
              return
            end
            if cmd_result.status == "OK" then
              vim.notify("Signed in as " .. cmd_result.user .. ".")
            end
          end)
        end
      end

      if result.status == "PromptUserDeviceFlow" then
        vim.notify("Enter your one-time code " .. result.userCode .. " in " .. result.verificationUri)
      elseif result.status == "AlreadySignedIn" then
        vim.notify("Already signed in as " .. result.user .. ".")
      end
    end
  )
end

local function sign_out()
  local client = get_client()
  if not client then
    vim.notify("Copilot LSP no está adjunto.", vim.log.levels.WARN)
    return
  end
  client:request("signOut", vim.empty_dict(), function(err, result)
    if err then
      vim.notify(err.message, vim.log.levels.ERROR)
      return
    end
    if result.status == "NotSignedIn" then
      vim.notify("Not signed in.")
    end
  end)
end

vim.api.nvim_create_user_command("LspCopilotSignIn", sign_in, { desc = "Sign in Copilot with GitHub" })
vim.api.nvim_create_user_command("LspCopilotSignOut", sign_out, { desc = "Sign out Copilot with GitHub" })

-- LazyVim exige que el módulo devuelva una spec; estos comandos son solo
-- efectos secundarios, así que devolvemos una spec vacía.
return {}
