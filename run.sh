#!/usr/bin/env sh

CONFIG_PATH=/etc/nginx/conf.d/default.conf

python3 /config.py > ${CONFIG_PATH} || exit $?

echo "--- Config preview: ---"
cat ${CONFIG_PATH}
echo "--- / Config preview ---"

exec "$@"
