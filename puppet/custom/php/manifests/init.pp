class php (
  $version = $php::params::version
) inherits php::params
{

  validate_re($version, ['hhvm', '5.5', 'latest'], 'The only php versions are hhvm, 5.5 and latest')

  class { 'php::install': }->
  class { 'php::curl': }->
  class { 'php::ini': }->
  class { 'php::pear_install': }->
  class { 'php::extensions': }

}
