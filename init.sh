#!/bin/bash

if [ ! -d project ]; then
	mkdir project
fi
cp Vagrantfile.dist Vagrantfile
cp common.yaml.dist common.yaml
cd puppet
echo -ne 'installing puppet modules...'
librarian-puppet update
echo "done"
