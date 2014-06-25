define vim::plugin($directory = $title, $repo) {
  
   git::reposync { $title:
       source_url      => "${repo}",
       destination_dir => "/home/vagrant/.vim/bundle/${directory}"
   }

}
