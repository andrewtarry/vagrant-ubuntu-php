class nodejs::install {

  package { 'nodejs':
    ensure => $nodejs::version
    } ->

    package { "npm":
      ensure => installed
    }
}

