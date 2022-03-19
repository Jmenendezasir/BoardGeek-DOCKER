#!/bin/bash

cd /frontend

git config --global user.email "jmenendezasir@gmail.com"
git config --global user.name "jmenendezasir"

git pull origin main

cd /frontend/appboardgeek

npm start