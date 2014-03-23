class python::software-properties {
	
	package { "python-software-properties":
		require => Exec['update_repo'],
		ensure => installed,
	}
}