class php {

	if !defined(Class['python']) {
		include python
	}

	include php::params, php::latest, php::install, php::curl, php::ini, php::pear_install, php::extensions

}