class jsonc::dbg {

	if $jsonc::dbg {

		package{ "libjson0-dbg":
			ensure => installed,
			require =>  Class['jsonc::install'],
		}

	}
}
