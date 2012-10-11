class mysql {
  package {
    "mysql-server":
      ensure => installed
  }

  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin/"]
  }

  file {
    "/etc/mysql/my.cnf":
      owner => root,
      group => root,
      mode => 644,
      content => template("mysql/my.cnf.erb"),
      require => Package["mysql-server"]
  }

  exec { "mysql_password":
    unless => "mysqladmin -uroot -proot status",
    command => "mysqladmin -uroot password root",
    require => Service["mysql"];
  }

  service {
    "mysql":
      ensure => running,
      enable => true,
      subscribe => File["/etc/mysql/my.cnf"]
  }
}