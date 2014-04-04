class nodejs::ubuntu {

	case $operatingsystem {
		/(Ubuntu|Debian)/: {
			
			file { "/usr/bin/node":
				ensure => link,
				target => "/usr/bin/nodejs",
				require => Class['nodejs::install']
			}

		}
	}

}