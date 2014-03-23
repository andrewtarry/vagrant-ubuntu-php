class symfony2::log {

	file { "${symfony2::log_dir}":
		ensure => directory,
		owner => vagrant,
		group => vagrant,
		mode => 777,
		recurse => true
	}

}