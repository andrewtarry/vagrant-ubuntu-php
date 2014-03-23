#!/bin/bash

if [ ! -d app ]; then
	mkdir app
fi
cp Vagrantfile.dist Vagrantfile
cp puppet/hieradata/common.yaml.dist puppet/hieradata/common.yaml
cd puppet
echo -ne 'installing puppet modules...'
librarian-puppet install
echo "done"