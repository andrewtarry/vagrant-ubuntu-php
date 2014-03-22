class webroot ($dir) {

	file { $dir:
		ensure => "directory",
		mode => 0755
	}
}