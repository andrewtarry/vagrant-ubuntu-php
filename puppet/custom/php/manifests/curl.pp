class php::curl {

  package { 'php5-curl':
    ensure => installed,
    require => Class['php::install']
  }

}
