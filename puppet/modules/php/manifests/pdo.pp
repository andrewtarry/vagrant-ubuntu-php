class php::pdo {

  package { "php5-sqlite":
    require => [Exec['update_repo'], Class['php::install']],
    ensure => installed,
  }

}