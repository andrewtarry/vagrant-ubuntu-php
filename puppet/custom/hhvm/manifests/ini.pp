class hhvm::ini {

  file { '/etc/hhvm/php.ini':
    source => 'puppet:///modules/hhvm/php.ini',
    require => Class['hhvm::install']
  }

}
