class phpmyadmin ($webserver = 'false') {

  # Only install phpmyadmin if there also a webserver
  if $webserver {
    include phpmyadmin::install, phpmyadmin::vhost
  }
}
