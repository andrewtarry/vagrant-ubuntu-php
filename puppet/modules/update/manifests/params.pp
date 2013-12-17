class update::params {
	case $operatingsystem {
		Centos: {
			$cmd = ''
			$update = false
		}
		/(Ubuntu|Debian)/: {
			$cmd = '/usr/bin/apt-get update'
			$update = true
		}
	}
}