class rsyslog($logstash_port = '5544') {
  $logstash_servers = servers_with_role("logstash")
  file { "/etc/rsyslog.d/99-puppet.conf":
    content => template("rsyslog/99-puppet.conf.erb"),
    owner => "root",
    group => "root",
    mode => "0644",
    ensure => file,
    notify => Service["rsyslog"],
  }

  service {"rsyslog":
    ensure => running,
    hasstatus => true,
    hasrestart => true,
  }
}

