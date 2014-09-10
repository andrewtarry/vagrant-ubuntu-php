Ubuntu with PHP 5.5 or HHMV
===========================

This Vagrant VM uses Ubuntu 14.04 Server with PHP 5.5 or HHVM. All of the options are managed by the `common.yaml` file in the root of the project. 

By default a site will be listening on `10.0.0.10:8000`. The document root by default is in `app/web` so the site will work straight away.

In addition phpMyAdmin will be installed on port `8001` if you enable it.

Installation
------------

This VM uses git submodules to include external libraries. 

To set up all of the libraries you can run `./init.sh`. Then the VM will start with a `vagrant up`.

Customisation
-------------

Most of the configuration can be changed in the `common.yaml`. If further customisation is needed you can change the `puppet/manifests/dev.pp`.
