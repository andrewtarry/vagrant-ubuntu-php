define php::pecl () {

	exec { "pecl-install ${title}":
		command => "pecl install ${title}",
		path => "/usr/bin:/bin",
		require => Class["php::install"],
		creates => "/usr/lib/php5/20121212/${title}.so"
	}	

}
