# Define: ipboard::create_mysql_database
# Parameters:
# arguments
#
define mysql::create_database ($name) {
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin/"]
  }
  
  exec { "create_application_database":
    unless => "mysql -uroot -proot $name",
    command => "mysql -uroot -proot -e 'create database $name'",
    require => Exec["mysql_password"]
  }
}
