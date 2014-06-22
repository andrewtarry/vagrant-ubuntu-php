class gcc::install {

	include make

	package{"gcc":
		ensure => installed
	}

}
