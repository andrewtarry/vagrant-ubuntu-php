class jsonc::dev {

	if $jsonc::dev {

		package{ "libjson0-dev":
			ensure => installed,
			require => Class['jsonc::install'],
		}

	}
}
