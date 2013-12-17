class nodejs::npm {

	package { "npm":
		require => Exec['update_repo'],
		ensure => installed,
	}

}