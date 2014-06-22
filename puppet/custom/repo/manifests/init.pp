class repo {

  class { 'repo::apt': } #->  class { 'repo::update': }

}
