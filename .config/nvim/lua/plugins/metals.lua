return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.on_attach = function(client, bufnr)
      local map = vim.keymap.set

      map("n", "gD", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "gds", vim.lsp.buf.document_symbol)
      map("n", "gws", vim.lsp.buf.workspace_symbol)
      map("n", "<leader>cl", vim.lsp.codelens.run)
      map("n", "<leader>sh", vim.lsp.buf.signature_help)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>f", vim.lsp.buf.format)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
    end

    metals_config.settings = {
      defaultBspToBuildTool = true,
      startMcpServer = true,
      enableBestEffort = true,
      serverVersion = "2.0.0-M7",
      serverProperties = { "-Xmx4g" },
    }

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}
