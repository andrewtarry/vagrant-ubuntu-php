class php::params {
	case $operatingsystem {
		Centos: {
			$php55_package = 'php55w'
		}
		/(Ubuntu|Debian)/: {
			$php55_package = 'php5'
		}
	}

}