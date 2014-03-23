class symfony2::cache {

	file { "${symfony2::cache_dir}":
		ensure => directory,
		owner => vagrant,
		group => vagrant,
		mode => 777,
		recurse => true
	}

}