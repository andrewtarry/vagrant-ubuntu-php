#!/bin/bash

git submodule init
git submodule update
cp Vagrantfile.dist Vagrantfile
cp puppet/hieradata/common.yaml.dist puppet/hieradata/common.yaml