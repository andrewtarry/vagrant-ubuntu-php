class jsonc::dbg {

	if $jsonc::dbg {

		package{ "libjson0-dbg":
			ensure => installed,
			require => [Exec['update_repo'], Class['jsonc::install']],
		}

	}
}