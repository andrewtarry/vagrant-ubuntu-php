class php::dev {

	if $dev {

		package { "php5-dev":
			require => Exec['update_repo'],
			ensure => installed,
		}

	}

}