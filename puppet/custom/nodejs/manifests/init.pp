class nodejs {

	if !defined(Class['python']) {
		include python
	}

	include nodejs::latest, nodejs::install, nodejs::ubuntu
}