class jsonc::dev {

	if $jsonc::dev {

		package{ "libjson0-dev":
			ensure => installed,
			require => [Exec['update_repo'], Class['jsonc::install']],
		}

	}
}