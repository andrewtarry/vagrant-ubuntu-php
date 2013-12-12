exec { "apt-get update":
    command => "/usr/bin/apt-get update"	   
}

node 'dev' {

	# PHP
	class { 'php': }

	class { 'nodejs': }

}