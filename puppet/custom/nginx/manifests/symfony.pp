define nginx::symfony (
  $host,
  $docroot,
  $phpport) {

    file { "/etc/nginx/sites-available/${host}":
      content => template('nginx/symfony.erb'),
      require => Class['nginx'],
      owner => root,
      group => root
    }->

    file { "/etc/nginx/sites-enabled/${host}":
      ensure => symlink,
      target => "/etc/nginx/sites-available/${host}",
      notify => Service['nginx']
    }
}
