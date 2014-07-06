class php::fpm {

  if $php::install_fpm {

    package { $php::params::php55_fpm:
      ensure => present
      }->

      service { $php::params::php55_fpm:
        ensure => 'running'
      }

      file { "/etc/php5/fpm/pool.d/app.conf":
        content => template('php/fpm.conf.erb'),
        ensure => file,
        notify => Service[$php::params::php55_fpm]
      }

  }

}
