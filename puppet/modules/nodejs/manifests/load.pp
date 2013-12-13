class nodejs::load {

	package { "nodejs":
		require => Exec['update'],
		ensure => installed,
	}
}