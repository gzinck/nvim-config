return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("minuet").setup({
        -- Use OpenAI-compatible provider
        provider = "openai_compatible",
        -- Reasonable context window for most use cases
        context_window = 8000,
        -- Throttle and debounce to avoid excessive API calls
        throttle = 1000,
        debounce = 400,
        -- Request timeout in seconds
        request_timeout = 3,
        -- Number of completion suggestions
        n_completions = 3,
        -- Provider-specific configuration
        provider_options = {
          openai_compatible = {
            end_point = "https://llm.lazertechnologies.com/v1",
            model = "groq/llama-3.1-8b-instant",
            name = "Lazer",
            api_key = "OPENAI_API_KEY", -- Set this environment variable
            optional = {
              max_tokens = 256,
              -- stop = { "\n\n" },
            },
          },
        },
      })

      -- Create a new autocmd group for Minuet events
      local group = vim.api.nvim_create_augroup('MinuetEvents', { clear = true })

      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'MinuetRequestStarted',
        group = group,
        callback = function(a)
          vim.print(a)
        end,
      })

      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'MinuetRequestFinished',
        group = group,
        callback = function(a)
          vim.print(a)
        end,
      })
    end,
  },
}
