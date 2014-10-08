# Class: ssh
#
# This module manages ssh
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ssh::server::redhat (
  $ensure = present,
  $ensure_status = running,
){

  include ssh::server::params

  package { $ssh::server::params::sshd_package :
    ensure => $ensure
  }

  service { $ssh::server::params::sshd_service :
    ensure     => $ensure_status,
    enable     => true,
    hasrestart => true,
    require    => Package[$ssh::server::params::sshd_package]
  }

}
