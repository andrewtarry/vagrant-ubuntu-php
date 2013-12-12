class nodejs::npm {

	package { "npm":
		require => Exec['apt-get update'],
		ensure => installed,
	}

}