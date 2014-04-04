class php::extensions {

	package { "php5-dev":
		require => [Exec['update_repo'],Class['php::install']],
		ensure => installed,
	}

	package { "php5-json":
		require => [Exec['update_repo'], Class['php::install'], Package['php5-dev']],
		ensure => installed,
	}

	package { "php5-mysql":
		require => [Exec['update_repo'], Class['php::install']],
		ensure => installed,
	}

	package { "php5-sqlite":
    	require => [Exec['update_repo'], Class['php::install']],
    	ensure => installed,
  	}

  	package { "php5-xdebug":
    	require => [Exec['update_repo'], Class['php::install']],
    	ensure => installed,
  	}
}