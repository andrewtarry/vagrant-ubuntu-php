class php::pear_install {

	package { "php-pear":
		require =>  Class['php::install'],
		ensure => installed,
	}

}

