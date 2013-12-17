class webroot ($dir) {

	file { $dir:
		ensure => "directory",
		owner => 'vagrant',
		group => 'vagrant',
		mode => 0755
	}
}