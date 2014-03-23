class gcc::install {

	include make

	package{"gcc":
		ensure => installed,
		require => Exec['update_repo'],
	}

}