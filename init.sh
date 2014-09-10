#!/bin/bash

if [ ! -d project ]; then
	mkdir project
fi
cp Vagrantfile.dist Vagrantfile
cp common.yaml.dist common.yaml
echo -ne 'installing puppet modules...'
git submodule init
git submodule update
echo "done"
