class rsyslog::service {
    service {"rsyslog":
        ensure => running,
        hasstatus => true,
        hasrestart => true,
    }
}