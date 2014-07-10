class php::config {

  file { "/etc/php5/cli/conf.d/20-xdebug.conf":
    source => "puppet:///modules/php/xdebug.ini",
    ensure => file,
    require => Class['php::extensions']
  }

  if $php::install_fpm {

    file { "/etc/php5/fpm/conf.d/20-xdebug.conf":
      source => "puppet:///modules/php/xdebug.ini",
      ensure => file
      }~> Service[$php::params::php55_fpm]

  }

}
