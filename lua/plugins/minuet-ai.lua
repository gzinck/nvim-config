return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("minuet").setup({
        -- Enable virtual text completion for better AI-assisted coding experience
        virtualtext = {
          auto_trigger_ft = { "lua", "tsx", "python", "javascript", "typescript", "go", "rust" },
          keymap = {
            -- Accept whole completion
            accept = "<A-A>",
            -- Accept one line
            accept_line = "<A-a>",
            -- Accept n lines (prompts for number)
            accept_n_lines = "<A-z>",
            -- Cycle to prev completion item, or manually invoke completion
            prev = "<A-[>",
            -- Cycle to next completion item, or manually invoke completion
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
        -- Use OpenAI-compatible provider
        provider = "openai",
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
          openai = {
            api_base = "https://llm.lazertechnologies.com",
            model = "groq/deepseek-r1-distill-llama-70b",
            api_key = "OPENAI_API_KEY", -- Set this environment variable
            optional = {
              max_tokens = 256,
              stop = { "\n\n" },
            },
          },
        },
      })
    end,
  },
}
