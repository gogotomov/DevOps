#!/bin/bash

#email="georgetomov@abv.bg"
#username="gogotomov"
script_path=$(readlink -f $0)
currentdate=$(date +"%d-%m-%Y %T.%N %Z")
git config --global user.e-mail georgetomov@abv.bg
git config --global user.name "gogotomov"
cd /home/gogo
mkdir -p $HOME/DevOps-Linux
cd /home/gogo/DevOps-Linux
git init
git remote add origin git@github.com:gogotomov/DevOps.git
cd /home/gogo/shellscript
cp -r "$script_path" "$HOME/DevOps-Linux"
cd /home/gogo/DevOps-Linux
git status
git add script.sh
git commit -m 'First Commmit'
git push -u origin master
echo "Current date is : $currentdate"
echo $currentdate >> "date.txt"
git add date.txt
git commit -m 'Date and time'
git push -u origin master
git checkout -b NewBranch master
appenddate=$(date +"%d-%m-%Y %T.%N %Z")
echo "Append date is : $appenddate"
echo $appenddate >> "date.txt"
echo "Old date is $currentdate , new date is $appenddate"
git commit -m 'Append Date'
git push -u origin NewBranch
