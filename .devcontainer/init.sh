#!/usr/bin/zsh

set -e

if grep -q "^\s*0\s*0.*" /proc/self/uid_map; then
	sudo chown node node_modules
else
	printf "Rootless mode detected.\n"
	sudo chown -R node /workspace/* /workspace/.[^.]* || true
	sudo chown node /workspace
fi

npm install
npm run build || test -f ./built/index.js