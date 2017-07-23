#!/bin/bash
git push
cd ../../aosn/elixir
git pull
cd mikan
git pull origin master
cd ..
git add mikan
git commit -m "update mikan"
git push

