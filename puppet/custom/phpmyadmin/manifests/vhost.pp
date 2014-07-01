class phpmyadmin::vhost {

  if $phpmyadmin::webserver == 'apache' {
    apache::vhost { 'phpmyadmin.dev':
      port => 8001,
      docroot  => '/home/vagrant/phpmyadmin',
      directory => '/home/vagrant/phpmyadmin',
      directory_allow_override => 'All',
      directory_require => 'all granted'
    }

  }elsif $phpmyadmin::webserver == 'nginx' {

  }

}
