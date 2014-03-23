class phpmyadmin::vhost {

	apache::vhost { 'phpmyadmin.dev':
		port => 8001,
	   docroot  => '/home/vagrant/phpmyadmin',
	   directory => '/home/vagrant/phpmyadmin',
	   directory_allow_override => 'All',
	   directory_require => 'all granted'
	}

}