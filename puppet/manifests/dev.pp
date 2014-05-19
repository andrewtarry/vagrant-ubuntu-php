# Load hiera variables
$git = hiera('git')
$php = hiera('php')
$apache = hiera('apache')
$nodejs = hiera('nodejs')
$mysql = hiera('mysql')
$c_tools = hiera('c_tools')
$vim = hiera('vim')
$dir = hiera('dir')
$ruby = hiera('ruby')
$java = hiera('java')
$mongodb = hiera('mongodb')
$r = hiera('r')

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
node 'default' {

    include curl
    include unzip

    # Set up the bash commands in the profile.
    #
    # There are no custom options as this command will only load the config file
    class { 'bash': }

    # Set up the hosts config
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

	if $dir['app'] == $dir['web'] {
		class { 'webroot':
			dir => $dir['app']
		}
	}else{
		class { 'webroot':
			dir => [$dir['app'], $dir['web']]
		}
	}

	if $php['install'] {

		# Install php
		class { 'php': }

		# Install phpmyadmin
		class { 'phpmyadmin': }

        class { 'composer':
          install_dir => '/usr/bin'
        }

        if $php['symfony2'] {
	        class { 'symfony2':
	        	cache_dir => $cache_dir,
	        	log_dir => $log_dir,
	    	}
	    }


	    if $mongodb['install'] {
	    	php::pecl { 'mongo': }
	    }

	}

	if $nodejs['install'] {

		class { 'nodejs': }

		nodejs::npm { 'grunt-cli': }
        nodejs::npm { 'bower': }

        package {'node-less':
          ensure => installed,
          require => Class['nodejs']
        }
	}

	if $apache['install'] {
		class { 'apache': }


		if $php['symfony2'] {
			apache::vhost { $apache['hostname']:
				port => $apache['siteport'],
			    docroot  => $dir['web'],
			    directory => $dir['web'],
			    directory_allow_override => 'All',
			    directory_require => 'all granted',
			    env_variables => ["CACHE_DIR \"${cache_dir}\"", "LOG_DIR \"${log_dir}\""]
			}
		}else {
			apache::vhost { $apache['hostname']:
				port => $apache['siteport'],
			    docroot  => $dir['web'],
			    directory => $dir['web'],
			    directory_allow_override => 'All',
			    directory_require => 'all granted'
			}
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

	if $ruby['install'] {
		class { 'ruby': }

	}

	if $java['install'] {

		include java

		if $java['jenkins'] {
			class { 'jenkins':
				install_java => false
			}

			jenkins::plugin {
			  "git" : ;
			}
		}
	}

	if $mongodb['install'] {
		include '::mongodb::server'
	}

	if $r['install'] {
		include r
	}
}	
