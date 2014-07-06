class php::install {


  # The main php package should always be installed so that the cli scripts will work
  package { $php::params::php55_package:
    ensure => $php::use_version
  }


}
