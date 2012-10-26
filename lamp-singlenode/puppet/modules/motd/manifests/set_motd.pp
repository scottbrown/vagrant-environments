define motd::set_motd ($content) {
  file {
    '/etc/motd':
      content => "$content\n"
  }
}