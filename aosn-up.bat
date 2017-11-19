git push
cd ../../aosn/elixir
git pull
git submodule update
cd mikan
git pull origin master
cd ..
git add mikan
git commit -m "update mikan"
git push
cd ../../mikan/elixir_practice