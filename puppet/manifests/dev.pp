include update

exec { "update_repo":
    command => $update::params::cmd	   
}

node 'dev' {

	# PHP
	class { 'php':
		version => '53',
	}

	# class { 'nodejs': }

}