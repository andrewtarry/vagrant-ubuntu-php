class php::libpcre {

	if $libpcre {

		package { "libpcre3-dev":
			require => Exec['update_repo'],
			ensure => installed,
		}

	}
}