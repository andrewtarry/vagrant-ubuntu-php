class repo::apt {

  # hhvm
  #  apt::key { 'hhvm_key':
  #  key_source => 'http://dl.hhvm.com/conf/hhvm.gpg.key'
  #}->

  apt::source { 'hhvm':
      location => 'http://dl.hhvm.com/ubuntu',
      repos => 'main',
      include_src => false,
      release => 'trusty',
      require => Class['repo::keys']
  }

  # PHP 5.5 with zend engine
  apt::ppa { 'ppa:ondrej/php5': }

}
