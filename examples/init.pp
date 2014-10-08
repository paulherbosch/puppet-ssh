include ssh::server

ssh::server::config { 'PermitRootLogin':
  sshd_parameter => 'PermitRootLogin',
  sshd_value     => 'no'
}
