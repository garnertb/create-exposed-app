---
to: package.json
---
{
  "name": "<%- npmPackageName %>",
  "version": "2.0.0",
  "description": "<%- oneLiner %>",
  "homepage": "https://github.com/<%- authorGithub %>/<%- packageName %>",
  "bugs": {
    "url": "https://github.com/<%- authorGithub %>/<%- packageName %>/issues"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/<%- authorGithub %>/<%- packageName %>.git"
  },
  "license": "MIT",
  "author": "<%- authorName %> <<%- authorEmail %>> (<%- authorWebsite %>)",
  "exports": {
    "require": "./dist/index.js",
    "import": "./dist/index.esm.js"
  },
  "main": "dist/index.js",
  "module": "dist/index.esm.js",
  "typings": "dist/index.d.ts",
  "scripts": {
    "dev": "npm run build-js--cjs--watch",
    "dev-tdd": "npm run test--watch",
    "format": "bash bin/format.sh",
    "lint": "run-p lint-es lint-ts lint-md",
    "lint-es": "eslint --ext .js,.jsx,.ts,.tsx --format=pretty ./",
    "lint-ts": "tsc --noEmit",
    "lint-md": "markdownlint '**/*.md'",
    "test": "jest",
    "test--coverage": "npm run test -- --coverage",
    "test--watch": "npm run test -- --watch",
    "build": "rimraf dist && run-p build-js build-dts",
    "build--watch": "run-p build-js--cjs--watch build-dts--watch",
    "build-js": "run-s build-js--cjs build-js--esm",
    "build-js--cjs": "node bin/build.js",
    "build-js--cjs--watch": "node bin/build.js --watch",
    "build-js--esm": "gen-esm-wrapper dist/index.js dist/index.esm.js",
    "build-dts": "tsc --emitDeclarationOnly",
    "build-dts--watch": "npm run build-dts -- --watch --preserveWatchOutput",
    "validate": "run-p --print-label lint test build",
    "commitlint--all": "npx commitlint --from $(git rev-list --max-parents=0 HEAD) --to HEAD",
    "major-updates": "npx npm-check-updates -u && npm install",
    "update": "npm update"
  },
  "dependencies": {
    "debug": "^4.3.3",
    "dotenv": "^16.0.0"
  },
  "devDependencies": {
    "@babel/core": "7.17.5",
    "@babel/preset-env": "7.16.11",
    "@babel/preset-typescript": "7.16.7",
    "@commitlint/cli": "16.2.1",
    "@commitlint/config-conventional": "16.2.1",
    "@types/debug": "4.1.7",
    "@types/jest": "27.4.1",
    "@typescript-eslint/eslint-plugin": "5.12.1",
    "@typescript-eslint/parser": "5.12.1",
    "babel-jest": "27.5.1",
    "doctoc": "2.1.0",
    "esbuild": "0.14.23",
    "eslint": "8.10.0",
    "eslint-config-airbnb-base": "15.0.0",
    "eslint-config-airbnb-typescript": "16.1.0",
    "eslint-config-prettier": "8.4.0",
    "eslint-formatter-pretty": "4.1.0",
    "eslint-plugin-eslint-comments": "3.2.0",
    "eslint-plugin-import": "2.25.4",
    "eslint-plugin-jest": "26.1.1",
    "eslint-plugin-jsx-a11y": "6.5.1",
    "eslint-plugin-promise": "6.0.0",
    "eslint-plugin-react": "7.29.2",
    "eslint-plugin-unicorn": "41.0.0",
    "gen-esm-wrapper": "1.1.3",
    "import-sort-cli": "6.0.0",
    "import-sort-parser-babylon": "6.0.0",
    "import-sort-parser-typescript": "6.0.0",
    "import-sort-style-module": "6.0.0",
    "jest": "27.5.1",
    "markdownlint-cli": "0.31.1",
    "npm-run-all": "4.1.5",
    "prettier": "2.5.1",
    "rimraf": "3.0.2",
    "sort-package-json": "1.54.0",
    "typescript": "4.5.5"
  }
}
