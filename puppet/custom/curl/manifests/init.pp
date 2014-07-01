class curl inherits curl::params {

  package {$curl::params::package :
    ensure => installed
  }

}
