class unzip {

	package { "unzip":
		require => Exec['update_repo'],
		ensure => installed,
	}

}