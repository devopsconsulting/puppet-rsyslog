define rsyslog::register($logfile, $order='01') {
    file { "/etc/rsyslog.d/${order}-${title}.conf":
      content => template("rsyslog/rsyslog-entry.conf.erb"),
      owner => "root",
      group => "root",
      mode => "0644",
      ensure => 'file',
      notify => Class["rsyslog::service"],
    }
}
