class php::server {

	file { '/usr/bin/start-server.sh':
		ensure => present,
        source => "puppet:///modules/php/start-server.sh",
        owner => "vagrant",
        group => "vagrant",
        mode => 755
	}

	if $php::start_server {

		exec { "start-server":
			command => "/usr/bin/start-server.sh",
			require => [Class['php::install'], File['/usr/bin/start-server.sh']]
		}
	}

}