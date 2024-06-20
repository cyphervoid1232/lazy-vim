return 
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function ()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "typescript", "html", "groovy", "gitignore", "java", "json", "json5", "dockerfile"},
      highlight = { enable = true },
      indent = { enable = true },  
    })
    end

  }
