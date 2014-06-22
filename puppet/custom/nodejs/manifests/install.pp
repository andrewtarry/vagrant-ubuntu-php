class nodejs::install {

    package { 'nodejs':
        ensure => installed
    } ->

    package { "npm":
        ensure => installed
     }
}

