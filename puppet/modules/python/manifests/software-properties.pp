class python::software-properties {
	
	package { "python-software-properties":
		require => Exec['apt-get update'],
		ensure => installed,
	}
}