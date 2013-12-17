class nodejs::load {

	package { "nodejs":
		require => Exec['update_repo'],
		ensure => installed,
	}
}