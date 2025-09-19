return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("minuet").setup({
        -- notify = 'debug',
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
        n_completions = 2,
        -- Provider-specific configuration
        provider_options = {
          openai_compatible = {
            end_point = "https://llm.lazertechnologies.com/v1/chat/completions",
            stream = true,
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
    end,
  },
}
