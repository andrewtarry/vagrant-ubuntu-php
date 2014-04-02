class phpmyadmin::install {

	file { "/tmp/phpmyadmin.tar": 
		source => "puppet:///modules/phpmyadmin/phpmyadmin.tar",
		ensure => file
	}

	file { "/home/vagrant/phpmyadmin":
		ensure => directory
	}

	exec { "extract": 
		command => "tar -zxvf /tmp/phpmyadmin.tar -C /home/vagrant/phpmyadmin --strip=1",
		path => '/usr/bin:/bin',
		require => [File['/tmp/phpmyadmin.tar'], File['/home/vagrant/phpmyadmin']],
		creates => '/home/vagrant/phpmyadmin/index.php'
	}

	file { "/home/vagrant/phpmyadmin/config.inc.php": 
		source => "puppet:///modules/phpmyadmin/config.inc.php",
		ensure => file,
		require => Exec['extract']
	}
}