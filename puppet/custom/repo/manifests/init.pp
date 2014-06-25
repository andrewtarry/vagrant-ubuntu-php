class repo {

  include repo::keys

  class { 'repo::apt': } ->  class { 'repo::update': }

}
