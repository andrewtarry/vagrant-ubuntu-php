class jsonc::dev {

	if $parent::dev {

		package{ "libjson0-dev":
			ensure => installed,
			require => [Exec['update_repo'], Class['jsonc::install']],
		}

	}
}