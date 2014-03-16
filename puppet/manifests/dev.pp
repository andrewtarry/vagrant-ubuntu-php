# Load hiera variables
$git = hiera('git')
$php = hiera('php')
$apache = hiera('apache')
$nodejs = hiera('nodejs')
$mysql = hiera('mysql')
$c_tools = hiera('c_tools')
$vim = hiera('vim')
$dir = hiera('dir')
$webhostname = hiera('hostname')

$log_dir = $dir['log']
$cache_dir = $dir['cache']

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

    class { 'bash':
      cache_dir => $cache_dir,
      log_dir => $log_dir
    }

    class { 'hosts':
      hostname => $webhostname
    }

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
		dir => [$dir['app'], $dir['web']]
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

		nodejs::npm { 'grunt-cli': }

	}

	if $apache['install'] {
		class { 'apache': }

		apache::vhost { $webhostname:
		   docroot  => $dir['web'],
		   directory => $dir['web'],
		   directory_allow_override => 'All',
		   directory_require => 'all granted',
		   env_variables => ["CACHE_DIR \"${cache_dir}\"", "LOG_DIR \"${log_dir}\""]
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