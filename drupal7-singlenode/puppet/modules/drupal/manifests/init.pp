class drupal {
  file { "/tmp/Makefile":
    ensure => file,
    content => template("drupal/Makefile.erb")
  }

  file { "/tmp/drupal_install.sh":
    ensure => file,
    content => template("drupal/drupal_install.sh.erb"),
    mode => 0755,
    require => File["/tmp/Makefile"]
  }

  exec { "install_drupal":
    creates => "/tmp/drupal.install.lock",
    command => "/tmp/drupal_install.sh && touch /tmp/drupal.install.lock",
    require => [ File["/tmp/drupal_install.sh"], Class[drush], Mysql::Grant_access_to_db[add_root_grants], Class[php5-gd], Class[apache2] ]
  }
}

