class make::install {

	package{ "make" :
		ensure => installed,
		require => Exec['update_repo'],
	}
}