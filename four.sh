# a million commits
for Y in {2022..2022}
do
  mkdir $Y
  cd $Y
  for M in {01..10}
  do
    mkdir $M
    cd $M
    for D in {03,04,06,07,08,09,12,13,15,18,19,20,22,23,24,26,28,30}
    do
      mkdir $D
      cd $D
      for i in {01..03}
      do
        echo "$i on $M/$D/$Y" > commit.md
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
        git add commit.md -f
        git commit --date="$Y-$M-$D 12:0$i:00" -m "chore: update commit" --no-verify        
      done
      cd ../
    done
    cd ../
  done
  cd ../
done
git push origin master --no-verify
git rm -rf 20**
git rm -rf 19**
git commit -am "cleanup"
git push origin master --no-verify