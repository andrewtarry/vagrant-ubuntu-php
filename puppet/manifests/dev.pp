# Load hiera variables
$git = hiera('git')
$php = hiera('php')
$apache = hiera('apache')
$nodejs = hiera('nodejs')
$mysql = hiera('mysql')
$c_tools = hiera('c_tools')
$vim = hiera('vim')
$app_dir = hiera('app_dir')
$app = hiera('app')

$log_dir = $app['log_dir']
$cache_dir = $app['cache_dir']

# Set up update command
include update

exec { "update_repo":
     command => $update::params::cmd,
     path => "/usr/bin:/usr/sbin:/bin",
     onlyif => "test -f /usr/bin/apt-get"
}

# Dev node
node 'dev' {

    include curl
    include bash

	if $c_tools['gcc'] {
		include gcc
	}

	if $git['install'] { 
		 include git
	}

	if $vim['install'] {
		class { 'vim': }
	}

	class { 'webroot': 
		dir => [hiera('app_dir'), hiera('web_dir')]
	}

# 	# PHP

	if $php['install'] {
		class { 'php': }

		class { 'phpmyadmin': }

        class { 'composer':
          install_dir => '/usr/bin'
        }

        class { 'symfony2':
        	cache_dir => $cache_dir,
        	log_dir => $log_dir,
    	}

    	if $php['phing'] {
	    	php::pear { 'phing':
	    		app => "phing/phing",
	    		channel => "pear.phing.info"
	    	}
	    }

	}

	if $nodejs['install'] {

		class { 'nodejs': }

		file { '/usr/bin/node':
		   ensure => 'link',
		   target => '/usr/bin/nodejs',
		   require => Class['nodejs']
		}

		package { 'grunt-cli':
	      ensure   => latest,
	      provider => 'npm',
	      require => File['/usr/bin/node']
	    }

	}

	if $apache['install'] {
		class { 'apache': }

		apache::vhost { 'dev-site':
		   docroot  => hiera('web_dir'),
		   directory => hiera('web_dir'),
		   directory_allow_override => 'All',
		   directory_require => 'all granted',
		   env_variables => ['CACHE_DIR "${cache_dir}"', 'LOG_DIR "${log_dir}"']
		}

	}

	if $mysql['install'] {
		class { 'mysql': }
	}

	if $c_tools['re2c'] {

		package{ 're2c':
			ensure => installed,
			require => Exec['update_repo'],
		}
	}

	if $c_tools['jsonc'] {

		class { 'jsonc': }
	}
}