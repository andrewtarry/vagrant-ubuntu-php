class php::install {

  if $php::version == 'hhvm' {
    $use_version = latest
  } else{
    $use_version = $php::version
  }


  # The main php package should always be installed so that the cli scripts will work
  package { $php::params::php55_package:
    ensure => $use_version
  }

}
