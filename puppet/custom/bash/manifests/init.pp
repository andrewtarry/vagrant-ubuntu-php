class bash ($cache_dir = false, 
$webserver = false,
$php = false
) {

  file { "/etc/profile.d/env.sh":
    content => template('bash/env.erb')
  }

}
