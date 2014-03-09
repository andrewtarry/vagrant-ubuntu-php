class php::pear_install {

	package { "php-pear":
		require => [Exec['update_repo'], Class['php::install']],
		ensure => installed,
	}

}

