define vim::plugin($directory = $title, $repo) {

   git::reposync { 'clone_repo':
       source_url      => "${repo}",
       destination_dir => "/home/vagrant/.vim/bundle/${directory}"
   }

}
