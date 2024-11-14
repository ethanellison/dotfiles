return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  config = function()
    require('chatgpt').setup {
      api_key_cmd = 'pass openai/api-key',
      openai_params = {
        model = 'gpt-4-turbo-preview',
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 500,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    }
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>C', '<cmd>ChatGPT<CR>', desc = 'ChatGPT' },
    { '<leader>Ce', '<cmd>ChatGPTEditWithInstruction<CR>', 'Edit with instruction', mode = { 'n', 'v' } },
    { '<leader>Cg', '<cmd>ChatGPTRun grammar_correction<CR>', 'Grammar Correction', mode = { 'n', 'v' } },
    { '<leader>Ct', '<cmd>ChatGPTRun translate<CR>', 'Translate', mode = { 'n', 'v' } },
    { '<leader>Ck', '<cmd>ChatGPTRun keywords<CR>', 'Keywords', mode = { 'n', 'v' } },
    { '<leader>Cd', '<cmd>ChatGPTRun docstring<CR>', 'Docstring', mode = { 'n', 'v' } },
    { '<leader>Cd', '<cmd>ChatGPTRun add_tests<CR>', 'Add Tests', mode = { 'n', 'v' } },
    { '<leader>Co', '<cmd>ChatGPTRun optimize_code<CR>', 'Optimize Code', mode = { 'n', 'v' } },
    { '<leader>Cs', '<cmd>ChatGPTRun summarize<CR>', 'Summarize', mode = { 'n', 'v' } },
    { '<leader>Cf', '<cmd>ChatGPTRun fix_bugs<CR>', 'Fix Bugs', mode = { 'n', 'v' } },
    { '<leader>Cx', '<cmd>ChatGPTRun explain_code<CR>', 'Explain Code', mode = { 'n', 'v' } },
    { '<leader>Cr', '<cmd>ChatGPTRun roxygen_edit<CR>', 'Roxygen Edit', mode = { 'n', 'v' } },
    { '<leaderCl', '<cmd>ChatGPTRun code_readability_analysis<CR>', 'Code Readability Analysis', mode = { 'n', 'v' } },
  },
}
