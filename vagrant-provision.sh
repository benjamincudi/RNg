#!/usr/bin/env bash

## Instructions pulled from https://gorails.com/setup/ubuntu/14.04

if [ "$(rails -v)" != 'Rails 4.2.3' ]
 then
    echo "first-time install"
    # install ruby dependencies
    sudo apt-get -qq update
    sudo apt-get -qq install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

    # get desired ruby version and create from source
    echo "installing ruby"
    cd
    wget --quiet http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.6.tar.gz
    tar -xzvf ruby-2.1.6.tar.gz
    cd ruby-2.1.6/
    ./configure
    make -s
    sudo make -s install
    ruby -v

    # don't install the docs, this is a mock production server
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
    # install the bundler
    gem install bundler

    # install NodeJS for Coffeescript and Asset Pipeline availability
    echo "installing nodejs"
    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get -qq update
    sudo apt-get -qq install nodejs

    # install required rails version
    echo "installing rails gem"
    gem install rails -v 4.2.3

    # add a repository, then update postgres
    echo "updating postgres"
    sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
    wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get -qq update
    sudo apt-get -qq install postgresql-common
    sudo apt-get -qq install postgresql-9.3 libpq-dev

    # add a postgres user, which the install doesn't do
    echo "creating user"
    sudo -u postgres createuser vagrant -s

    # initialize the project
    cd /vagrant
    bundle install
    # initialize the database
    rake db:create
    rake db:setup
 fi

 # run any new migrations
 cd /vagrant
 rake db:migrate