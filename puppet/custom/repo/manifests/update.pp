class repo::update {

  exec { "update_repo":
     command => 'apt-get update',
     path => "/usr/bin:/usr/sbin:/bin",
     onlyif => "test -f /usr/bin/apt-get"
  }

}
