define php::pear (
	$app,
	$channel = ""
	) {

	if $channel != "" {

		exec { "pear-channel":
			command => "pear channel-discover ${channel}",
			path => "/usr/bin",
			require => Class["php::pear_install"]
		}

		exec { "pear-install":
			command => "pear install ${app}",
			path => "/usr/bin",
			require => Exec["pear-channel"]
		}

	}else {

		exec { "pear-install":
			command => "pear install ${app}",
			path => "/usr/bin",
			require => Class["php::pear_install"]
		}

	}

}