#!/bin/sh
echo "Yo dawg, I heard you like entrypoints, so I put an entrypoint in your entrypoint."

if
  [ "$NODE_ENV" = "development" ]
then
  npm install 
fi
npm install

exec "$@"