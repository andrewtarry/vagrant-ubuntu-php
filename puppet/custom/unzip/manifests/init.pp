class unzip inherits unzip::params {

  package { $unzip::params::package :
    ensure => latest
  }

}
