class nodejs::load {

	package { "nodejs":
		require => Exec['apt-get update'],
		ensure => installed,
	}
}