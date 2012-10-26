# Define: mysql::create_user
# Parameters:
# $db_user: the root user
# $db_pass: the root user's password
# $database_name: the name of the database being modified
# $username: the username of the user
# $password: the user's password
# $ip_address: the IP where the user is connecting from
#
define mysql::create_user ($db_user, $db_pass, $database_name, $username, $password, $ip_address) {
  exec { "create-${username}-db-on-${ip_address}":
    unless => "/usr/bin/mysql -u${username} -p${password} ${database_name}",
    command => "/usr/bin/mysql -u${db_user} -p${db_pass} -e \"grant all on ${database_name}.* to ${username}@${ip_address} identified by '${password}';\"",
    require => Service[mysql]
  }
}