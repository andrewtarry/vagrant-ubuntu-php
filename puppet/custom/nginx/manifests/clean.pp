class nginx::clean {

  file { '/etc/nginx/sites-available/default':
    ensure => absent,
    notify => Service['nginx'],
    require => Class['nginx::install']
  }

}
