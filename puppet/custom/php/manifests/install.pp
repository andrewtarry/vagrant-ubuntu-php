class php::install {

	if $php::version == '55' {
		
		package { $php::params::php55_package:
			ensure => installed
		}

	}

}
