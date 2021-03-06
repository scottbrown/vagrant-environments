node default {
  group {
    "puppet":
      ensure => present
  }

  exec {
    "apt-update":
      command => "sudo apt-get update",
      require => Group[puppet]
  }
  Exec["apt-update"] -> Package <| |>
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin/"]
  }
}

node web inherits default {
  motd::set_motd { "set_web_motd":
    content => "Drupal 7 Single Node"
  }

  include apache2
  include php5
  include php5-mysql
  include php5-gd
  include drush
  include drupal
  include apc
  include mysql

  mysql::create_database { "create_db":
    name => "drupal7"
  }

  mysql::grant_access_to_db { "add_root_grants":
    username => "root",
    password => "root",
    ip_address => "localhost",
    require => Mysql::Create_database[create_db]
  }
}

