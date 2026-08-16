## --- OPENROUTER CLAUDE SETUP --- ###

## - openrouter api integration - ##
## export OPENROUTER_API_KEY=""
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"
export ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY"
## export ANTHROPIC_API_KEY=""

## - openrouter model configuration - ##
export ANTHROPIC_DEFAULT_SONNET_MODEL="moonshotai/kimi-k2.7-code"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="moonshotai/kimi-k2.7-code"
export CLAUDE_CODE_SUBAGENT_MODEL="moonshotai/kimi-k2.7-code"
