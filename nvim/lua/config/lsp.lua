vim.lsp.enable('ccls')
vim.lsp.enable('lua_ls')

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = {
    current_line = true,
  },
  underline = true,
  update_in_insert = true
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end

    local keyops = { noremap = true, silent = true, buffer = args.buf }

    if client:supports_method('textDocument/hover') then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, keyops)
    end

    if client:supports_method('textDocument/definition') then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, keyops)
    end

    if client:supports_method('textDocument/declaration') then
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, keyops)
    end
  end,
})
