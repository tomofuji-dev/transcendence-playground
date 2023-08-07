#!/bin/sh

# いずれかのコマンドが失敗すると、非0のステータスで終了する
set -e

export PATH="./node_modules/.bin:$PATH"

# migration
npx prisma migrate deploy

# seeding
npx prisma db seed

# 型テスト
tsc --noEmit

# lint
npm run lint

# unit test
env-cmd -f ./.env/.env.prod jest

# e2e test
env-cmd -f ./.env/.env.prod jest --config ./test/jest-e2e.json
