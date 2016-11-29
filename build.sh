#!/bin/sh

cd /app

yarn install
bower --allow-root install
polymer build
