class git::install {

	package { "git":
		ensure => installed,
		require => Exec['update_repo'],
	}
}