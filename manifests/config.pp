class rsyslog::config($logstash_port, $logstash_server) {
    include stdlib
    if ! empty($logstash_server) {
        file {"logstash-endpoint":
            path => "/etc/rsyslog.d/00-logstash-endpoint.conf",
            content => inline_template("*.* @@<%= logstash_server['ipaddress'] -%>:<%= logstash_port -%>\n"),
            ensure => 'file',
            owner => "root",
            group => "root",
            mode => "0644",
            notify => Class["rsyslog::service"]
        }
    }

    rsyslog::register{"puppet-agent":
      logfile => '/var/log/puppet.log',
      order => '99'
    }
}
