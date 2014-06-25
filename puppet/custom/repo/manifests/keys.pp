class repo::keys {

  file {'/tmp/hhvm.key':
    source => 'puppet:///modules/repo/hhvm.gpg.key',
    ensure => 'present'
  }->

  exec{'hhvm_key':
    command => 'apt-key add /tmp/hhvm.key',
    path => '/usr/bin:/bin'
  }


}

