
class monitoring::install {
  # some useful perl modules to install

  package { "perl-Authen-SASL": 
    name => $operatingsystem ? { /(CentOS|Redhat|Fedora)/ => "perl-Authen-SASL", /(Debian|Ubuntu)/ => "libauthen-sasl-perl"},
    ensure => installed, 
  }
  package { "perl-Mail-Sender": 
    name => $operatingsystem ? { /(CentOS|Redhat|Fedora)/ => "perl-Mail-Sender", /(Debian|Ubuntu)/ => "libmail-sender-perl"},
    ensure => installed,
  }
  package { "perl-Mail-IMAPClient":
    name => $operatingsystem ? { /(CentOS|Redhat|Fedora)/ => "perl-Mail-IMAPClient", /(Debian|Ubuntu)/ => "libmail-imapclient-perl"},
    ensure => installed,
  }
  package { "perl-YAML":
    name => $operatingsystem ? { /(CentOS|Redhat|Fedora)/ => "perl-YAML", /(Debian|Ubuntu)/ => "libyaml-perl" },
    ensure => installed,
  }

  package { "libwww-perl":
    name => $operatingsystem ? { /(Debian|Ubuntu)/ => "libwww-perl", /(CentOS|Redhat|Fedora)/ => "perl-libwww-perl"},
    ensure => installed,
  }
  case $operatingsystem {
    RedHat,CentOS: {
      package { "nagios-plugins-perl":
        ensure => installed,
      }
    }
    Fedora: {
      package { "nagios-plugins-perl":
        ensure => installed,
      }
      package { "perl-LWP-Protocol-https":
        ensure => installed,
      }
    }
    Debian,Ubuntu: {
      package { "liblwp-protocol-https-perl":
        ensure => installed,
      }
    }
    default: {
      exec { "install LWP::Protocol::https via cpan":
        command => "perl -MCPAN -e '\$ENV{PERL_MM_USE_DEFAULT}=1; CPAN::Shell->install(\"LWP::Protocol::https\")'",
        onlyif => "test `perl -MLWP::Protocol::https -e 'print 1' 2>/dev/null || echo 0` == '0'",
        require => Package["libwww-perl"],
      }
    }
  }

  package { "perl-Crypt-SSLeay":
    ensure => installed,
  }

}
