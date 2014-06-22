class php::extensions {

	package { "php5-dev":
		require => Class['php::install'],
		ensure => installed,
	} ->

	package { "php5-json":
		require => Class['php::install'],
		ensure => installed,
	}

	package { "php5-mysql":
		require => Class['php::install'],
		ensure => installed,
	}

	package { "php5-sqlite":
    	require => Class['php::install'],
    	ensure => installed,
  	}

  	package { "php5-xdebug":
    	require => Class['php::install'],
    	ensure => installed,
  	}
}
