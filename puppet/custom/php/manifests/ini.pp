class php::ini {

	$php = hiera('php')
	$extensions = $php['pecl_extensions']

	file{"/etc/php5/apache2/php.ini" :
		content => template('php/php.ini.erb'),
		ensure => file,
		require => Class['php::extensions']
	}

	file{"/etc/php5/cli/php.ini" :
		content => template('php/php.cli.ini.erb'),
		ensure => file,
		require => Class['php::extensions']
	}
}