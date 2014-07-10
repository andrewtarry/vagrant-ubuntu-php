class php (
  $version = $php::params::version,
  $port = $php::params::port
) inherits php::params
{

  validate_re($version, ['hhvm', '5.5', 'latest'], 'The only php versions are hhvm, 5.5 and latest')

  if $version == 'hhvm' {
    $use_version = latest
    $install_fpm = false
  } else{
    $use_version = $version
    $install_fpm = true
  }


  class { 'php::install': }->
  class { 'php::fpm': } ->
  class { 'php::curl': }->
  class { 'php::ini': }->
  class { 'php::pear_install': }->
  class { 'php::extensions': }
  class { 'php::config': }

}
