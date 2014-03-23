class php::ini {

	file{"/etc/php5/apache2/php.ini" :
		source => "puppet:///modules/php/php.ini",
		ensure => file,
		require => Class['php::extensions']
	}

	file{"/etc/php5/cli/php.ini" :
		source => "puppet:///modules/php/php.ini.cli",
		ensure => file,
		require => Class['php::extensions']
	}
}