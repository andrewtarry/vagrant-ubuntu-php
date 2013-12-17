$docRoot = "/home/vagrant/site/dev"
$docRootPath = ["/home/vagrant/site", $docRoot]

include update

exec { "update_repo":
     command => $update::params::cmd,
     path => "/usr/bin:/usr/sbin:/bin",
     onlyif => "test -f /usr/bin/apt-get"
}

node 'dev' {

	class { 'git': }

	class { 'vim': }

	class { 'webroot': 
		dir => $docRootPath
	}

# 	# PHP
	class { 'php':
		version => '53'
	}

	class { 'nodejs': }

	class { 'apache': }

	apache::vhost { 'devSite':
	   docroot  => $docRoot 
	}

	class { 'mysql': }
}