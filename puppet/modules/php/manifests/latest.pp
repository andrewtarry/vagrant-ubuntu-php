class php::latest {

	case $operatingsystem {
		/(Ubuntu|Debian)/: {
			include apt

			apt::ppa { 'ppa:ondrej/php5': }
		}
	}

}