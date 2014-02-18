$docRoot = "/home/vagrant/app"
$docRootPath = ["/home/vagrant/app/web", $docRoot]

$gcc = true
$git = true
$re2c = false
$jsonc = false
$php = true
$apache = true
$nodejs = false
$mysql = true

include update

exec { "update_repo":
     command => $update::params::cmd,
     path => "/usr/bin:/usr/sbin:/bin",
     onlyif => "test -f /usr/bin/apt-get"
}

node 'dev' {

	if $gcc {
		include gcc
	}

	if $git { 
		 include git
	}

	class { 'vim': }

	class { 'webroot': 
		dir => $docRootPath
	}

# 	# PHP

	if $php {
		class { 'php': 
			dev => true,
			libpcre => true
		}

		class { 'phpmyadmin': }

	}

	if $nodejs {
		class { 'nodejs': }

	}

	if $apache {

		class { 'apache': }

		apache::vhost { 'devSite':
		   docroot  => $docRoot
		}

	}

	if $mysql {

		class { 'mysql': }
	}

	if $re2c {

		package{ 're2c':
			ensure => installed,
			require => Exec['update_repo'],
		}

	}

	if $jsonc {

		class { 'jsonc': 
			dbg => false
		}
	}
}