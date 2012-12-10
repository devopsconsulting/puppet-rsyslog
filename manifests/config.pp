class rsyslog::config($logstash_port, $logstash_server) {
    if $logstash_server {
        file {"logstash-endpoint":
            content => template("*.* @@<%= logstash_server['ipaddress'] -%>:<%= logstash_port -%>"),
            ensure => 'file'
            owner => "root",
            group => "root",
            mode => "0644",
            notify => Class["rsyslog::service"],
        }
    }

    rsyslog::register{"puppet-agent":
      logfile => '/var/log/puppet.conf',
      order => '99'
    }
}