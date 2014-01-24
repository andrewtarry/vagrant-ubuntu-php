$docRoot = "/home/vagrant/site/dev"
$docRootPath = ["/home/vagrant/site", $docRoot]

$gcc = true
$git = true
$re2c = true
$jsonc = true

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
	class { 'php': 
		dev => true,
		libpcre => true
	}

	class { 'phpmyadmin': }

	class { 'nodejs': }

	class { 'apache': }

	apache::vhost { 'devSite':
	   docroot  => $docRoot
	}

	class { 'mysql': }


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