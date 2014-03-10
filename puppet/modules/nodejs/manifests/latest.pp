class nodejs::latest {

	case $operatingsystem {
		/(Ubuntu|Debian)/: {
			include apt

			apt::ppa { 'ppa:chris-lea/node.js': }
		}
	}

}