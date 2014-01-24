class jsonc::dbg {

	if $parent::dev {

		package{ "libjson0-dbg":
			ensure => installed,
			require => [Exec['update_repo'], Class['jsonc::install']],
		}

	}
}