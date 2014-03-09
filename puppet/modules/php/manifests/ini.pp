class php::ini {

	file{"/etc/php5/apache2/php.ini" :
		source => "puppet:///modules/php/php.ini",
		ensure => file
	}

	file{"/etc/php5/cli/php.ini" :
		source => "puppet:///modules/php/php.ini",
		ensure => file
	}
}