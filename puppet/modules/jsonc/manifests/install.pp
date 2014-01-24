class jsonc::install {

	package{ "libjson0":
		ensure => installed,
		require => Exec['update_repo'],
	}

}