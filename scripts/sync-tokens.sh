#!/usr/bin/env sh
# Sincroniza styles/tokens.css com a fonte de verdade no repositorio do Taina.
#
#   ./scripts/sync-tokens.sh
#   TAINA_TOKENS_SRC=../taina/assets/css/tokens.css ./scripts/sync-tokens.sh
#
# Com TAINA_TOKENS_SRC definido, copia de um checkout local. Sem ele, baixa do
# GitHub (branch main). O arquivo e vendorizado: nunca edite a mao.

set -eu

dest="styles/tokens.css"
url="https://raw.githubusercontent.com/taina-labs/taina/main/assets/css/tokens.css"
src="${TAINA_TOKENS_SRC:-}"

if [ -n "$src" ]; then
  if [ ! -f "$src" ]; then
    printf 'arquivo nao encontrado: %s\n' "$src" >&2
    exit 1
  fi
  cp "$src" "$dest"
else
  if ! command -v curl >/dev/null 2>&1; then
    printf 'curl nao encontrado. Defina TAINA_TOKENS_SRC apontando para um checkout do Taina.\n' >&2
    exit 1
  fi
  curl -fsSL "$url" -o "$dest"
fi

printf 'tokens.css sincronizado a partir de %s\n' "${src:-$url}"
