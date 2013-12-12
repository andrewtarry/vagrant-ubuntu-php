class php::load {

	package { "php5":
		require => [Class['python::software-properties'], Class['php::latest'], Exec['apt-get update']],
		ensure => installed,
	}

}