class php::latest {

	case $operatingsystem {
		/(Ubuntu|Debian)/: {
			if !defined(Class['apt']) {
				include apt
			}

			apt::ppa { 'ppa:ondrej/php5': }
		}
	}

}