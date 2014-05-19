class r {

	package { "r-base-core":
		ensure => installed,
		require => Exec['update_repo']
	}

}