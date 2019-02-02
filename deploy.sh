#!/bin/bash
git stash --all
git checkout master
git push -f deploy master
ssh dokku@206.189.200.49
dokku run api bundle exec rake db:migrate