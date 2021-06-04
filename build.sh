#!/bin/bash

# docker build -t my .

# get github source

rm -rf src

git clone --depth 1 https://github.com/X-Profiler/xprofiler-console.git src/console
git clone --depth 1 https://github.com/X-Profiler/xtransit-manager.git src/manager
git clone --depth 1 https://github.com/X-Profiler/xtransit-server.git src/server

rm -rf src/console/.git
rm -rf src/manager/.git
rm -rf src/server/.git

# touch egg configuration

touch 
