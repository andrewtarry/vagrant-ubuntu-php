define nodejs::npm() {

	exec { $title:
		command => "npm install -g ${title}",
		path => "/usr/bin",
		creates => "/usr/bin/${title}",
		require => Class["nodejs::install"]
	}

}