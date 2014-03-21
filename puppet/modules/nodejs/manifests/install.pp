class nodejs::install {

	package { 'nodejs':
		require => [Class['python::software-properties'], Class['nodejs::latest'], Exec['update_repo']],
		ensure => installed,
	}

	package { "npm":
		ensure => installed,
		require => Package['nodejs']
	}
}