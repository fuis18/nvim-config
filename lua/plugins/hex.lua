-- Vista/edición hexadecimal para binarios (xxd). Carga al inicio a propósito:
-- setup() registra autocmds BufReadPre/Post que deben existir antes de abrir
-- el primer archivo para detectar `nvim -b` y binarios por extensión/encoding.
return {
  "RaafatTurki/hex.nvim",
  opts = {},
}
