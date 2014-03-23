class php::params {
	case $operatingsystem {
		Centos: {
			$php55_package = 'php'
		}
		/(Ubuntu|Debian)/: {
			$php55_package = 'php5'
		}
	}

}