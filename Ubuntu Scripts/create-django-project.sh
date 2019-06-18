#!/bin/sh

create(){ 
    python3 create-django-project.py $1
    cp -r .gitignore /media/eyakub/Important/Django\ Projects/$1
    cd
    cd /media/eyakub/Important/Django\ Projects/$1
    mkdir 'src'
    virtualenv venv
    cd /media/eyakub/Important/Django\ Projects/$1
    . venv/bin/activate
    pip3 install django==2.2
    cd
    cd /media/eyakub/Important/Django\ Projects/$1/src
    django-admin startproject $1 .

    cd ..
    git init
    touch README.md
    git add .
    git commit -m "init commit"
    git remote add origin https://github.com/eyakub/$1.git
    git push origin master

    code .
}


echo "Enter your Project/Repo name:"
read projectName

create $projectName 
