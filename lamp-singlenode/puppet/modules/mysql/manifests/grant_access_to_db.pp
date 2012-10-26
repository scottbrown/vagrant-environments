# Define: mysql::grant_access_to_db
# Parameters:
# arguments
#
define mysql::grant_access_to_db ($username, $password, $ip_address) {
  exec { "grant_access_to_$ip_address":
    command => "mysql -u${username} -p${password} mysql -e \"grant all on *.* to ${username}@'${ip_address}' identified by '${password}'; flush privileges;\"",
    path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
    require => Service[mysql]
  }
}