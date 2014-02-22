Ubuntu with PHP 5.5
===================

This Vagrant VM uses Ubuntu 13.10 Server with PHP 5.5 installed. All of the options are managed via the `puppet/hieradata/common.yaml`. 

By default a site called from dev-site will be listening on `10.0.0.10` so add that to your hosts file. The document root by default is in `app/web` so the site will work straight away.

Installation
------------

This VM will work with Vagrant but does need some additional git submodules to make sure you  install them before starting the VM.

	$ git submodule update
	$ vagrant up
	
