Ubuntu with PHP 5.5
===================

This Vagrant VM uses Ubuntu 14.04 Server with PHP 5.5 installed. All of the options are managed via hiera the `puppet/hieradata` directory. 

By default a site will be listening on `10.0.0.10:8000`. The document root by default is in `app/web` so the site will work straight away.

In addition phpMyAdmin will be installed on port `8001` so you.

Installation
------------

This VM uses [librarian-puppet](http://librarian-puppet.com/) and this will need to be installed before the VM can be started.

To set up all of the libraries you can run `./init.sh`. Then the VM will start with a `vagrant up`.

Customisation
-------------

Most of the configuration can be changed in the `puppet/hieradata/common.yaml`. If further customisation is needed you can change the `puppet/manifests/dev.pp`.
