class phpmyadmin {

	package { "phpmyadmin":
		require => Exec['update_repo'],
		ensure => installed,
	}

}