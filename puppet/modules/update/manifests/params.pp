class update::params {
	case $operatingsystem {
		Centos: {
			$cmd = '/usr/bin/yum update'
		}
		/(Ubuntu|Debian)/: {
			$cmd = '/usr/bin/apt-get update'
		}
	}
}