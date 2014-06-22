class python::software-properties {
	
	package { "python-software-properties":
		require => Class['repo'],
		ensure => installed
	}
}
