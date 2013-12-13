class nodejs::npm {

	package { "npm":
		require => Exec['update'],
		ensure => installed,
	}

}