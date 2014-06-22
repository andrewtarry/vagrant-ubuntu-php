class php (
  $version = $php::params::version
) inherits php::params
{

	include php::install, php::curl, php::ini, php::pear_install, php::extensions

}
