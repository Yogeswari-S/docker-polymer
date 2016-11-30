#!/bin/sh

cd /app

npm install
bower --allow-root install
polymer build
