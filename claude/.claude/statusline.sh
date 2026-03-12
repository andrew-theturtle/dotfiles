#!/bin/bash
input=$(cat)

# Parse JSON using Python (more commonly available than jq)
# Use | as delimiter to handle spaces in model name
PARSED=$(echo "$input" | python3 -c "
import sys, json
try:
    data = json.load(sys.stdin)
    model = data.get('model', {}).get('display_name', 'unknown')
    cost = data.get('cost', {}).get('total_cost_usd', 0)
    input_tokens = data.get('context_window', {}).get('total_input_tokens', 0)
    output_tokens = data.get('context_window', {}).get('total_output_tokens', 0)
    context_used = data.get('context_window', {}).get('used_percentage', 0)
    print(f'{model}|{cost:.4f}|{input_tokens}|{output_tokens}|{context_used}')
except:
    print('unknown|0.0000|0|0|0')
" 2>/dev/null)

# Split by delimiter
IFS='|' read -r MODEL COST INPUT_TOKENS OUTPUT_TOKENS CONTEXT_USED <<< "$PARSED"

# Fallback values
MODEL=${MODEL:-unknown}
COST=${COST:-0.0000}
INPUT_TOKENS=${INPUT_TOKENS:-0}
OUTPUT_TOKENS=${OUTPUT_TOKENS:-0}
CONTEXT_USED=${CONTEXT_USED:-0}

# Colors
GREEN='\033[01;32m'
BLUE='\033[01;34m'
YELLOW='\033[01;33m'
RESET='\033[00m'

# Output: user@host:path | [Model] $cost | tokens | context%
printf "${GREEN}%s@%s${RESET}:${BLUE}%s${RESET} | ${YELLOW}[%s]${RESET} \$%s | %s in/%s out | %s%%" \
  "$(whoami)" "$(hostname -s)" "$(pwd)" \
  "$MODEL" "$COST" "$INPUT_TOKENS" "$OUTPUT_TOKENS" "$CONTEXT_USED"
