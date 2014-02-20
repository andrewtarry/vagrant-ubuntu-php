# Load hiera variables
$git = hiera('git')
$php = hiera('php')
$apache = hiera('apache')
$nodejs = hiera('nodejs')
$mysql = hiera('mysql')
$c_tools = hiera('c_tools')
$vim = hiera('vim')

# Set up update command
include update

exec { "update_repo":
     command => $update::params::cmd,
     path => "/usr/bin:/usr/sbin:/bin",
     onlyif => "test -f /usr/bin/apt-get"
}

# Dev node
node 'dev' {

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

	}

	if $nodejs['install'] {
		class { 'nodejs': }

	}

	if $apache['install'] {
		class { 'apache': }

		apache::vhost { 'dev-site':
		   docroot  => $apache['docRoot']
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