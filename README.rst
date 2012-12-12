puppet-rsyslog: rsyslog module
==============================

Enabling rsyslog, optionally with a logstash backend::

    class {"rsyslog":
        logstash_port => '5544',
        logstash_server => {'ipaddress' => '123.53.43.1'}
    }

Without logstash::

    class {"rsyslog":}

Include a (non syslog) file into rsyslog::

    rsyslog::register {"apache": 
        logfile => '/var/log/httpd/errors.log',
        order => '67'
    }

example
-------

::

    class {"rsyslog":
        logstash_server => server_with_role("logstash", false),
        stage => 'setup'
    }
    
    rsyslog::register{"puppet-agent":
      logfile => '/var/log/puppet.log',
      order => '99'
    }
