class profile::base(
  Array $ntp_servers,
) {
  class { '::ntp':
    ntp_servers => $ntp_servers
  }
  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}
