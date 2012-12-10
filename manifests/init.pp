class rsyslog($logstash_port = '5544', $logstash_server=[]) {
    class {"rsyslog::config":
        logstash_port => $logstash_port,
        logstash_server => $logstash_server
    } ->
    class {"rsyslog::service":}
}
