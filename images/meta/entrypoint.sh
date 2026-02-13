#!/usr/bin/env bash
set -Eeuo pipefail

export PG_META_PORT="${PG_META_PORT:-8080}"
export PG_META_DB_USER="${PG_META_DB_USER:-supabase_admin}"

if [ -n "${POSTGRES_HOST}" ]; then
  export PG_META_DB_HOST="${POSTGRES_HOST}"
fi

if [ -n "${POSTGRES_PORT}" ]; then
  export PG_META_DB_PORT="${POSTGRES_PORT}"
fi

if [ -n "${POSTGRES_DB}" ]; then
  export PG_META_DB_NAME="${POSTGRES_DB}"
fi

if [ -n "${POSTGRES_PASSWORD}" ]; then
  export PG_META_DB_PASSWORD="${POSTGRES_PASSWORD}"
fi

if [ -n "${PG_META_CRYPTO_KEY}" ]; then
  export CRYPTO_KEY="${PG_META_CRYPTO_KEY}"
fi

exec "${@}"