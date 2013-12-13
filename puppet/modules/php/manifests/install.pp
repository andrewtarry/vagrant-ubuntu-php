class php::install {

	if $version == '55' {

		package { $php::params::php55_package:
			require => [Class['python::software-properties'], Class['php::latest'], Exec['update_repo']],
			ensure => installed,
		}

	}
	else {
		package { $php::params::php55_package:
			require => Exec['update_repo'],
			ensure => installed,
		}
	}

}