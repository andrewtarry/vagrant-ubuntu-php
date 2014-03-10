define php::pear (
	$app,
	$channel = ""
	) {

	if $channel != "" {

		exec { "pear-channel":
			command => "pear channel-discover ${channel}",
			path => "/usr/bin:/bin",
			require => Class["php::pear_install"],
			unless => "pear list-channels | grep ${channel}"
		}

		exec { "pear-install":
			command => "pear install ${app}",
			path => "/usr/bin:/bin",
			require => Exec["pear-channel"],
			creates => "/usr/bin/${title}"
		}

	}else {

		exec { "pear-install":
			command => "pear install ${app}",
			path => "/usr/bin:/bin",
			require => Class["php::pear_install"],
			creates => "/usr/bin/${title}"
		}

	}

}