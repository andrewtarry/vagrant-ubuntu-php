class curl {

  package {'curl':
    ensure => installed,
    require => Exec['update_repo'],
  }

}