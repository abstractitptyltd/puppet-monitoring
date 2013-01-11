class monitoring::timeperiods {

nagios_timeperiod { "24x7":
  timeperiod_name => "24x7",
  alias           => "24 Hours A Day, 7 Days A Week",
  sunday          => "00:00-24:00",
  monday          => "00:00-24:00",
  tuesday         => "00:00-24:00",
  wednesday       => "00:00-24:00",
  thursday        => "00:00-24:00",
  friday          => "00:00-24:00",
  saturday        => "00:00-24:00",
  notify      => Class[$monitoring_service],
}


nagios_timeperiod { "workhours":
  timeperiod_name => "workhours",
  alias           => "Normal Working Hours",
  monday          => "09:00-17:00",
  tuesday         => "09:00-17:00",
  wednesday       => "09:00-17:00",
  thursday        => "09:00-17:00",
  friday          => "09:00-17:00",
  notify      => Class[$monitoring_service],
}


nagios_timeperiod { "nonworkhours":
  timeperiod_name  => "nonworkhours",
  alias      => "Non-Work Hours",
  sunday      => "00:00-24:00",        ## Every Sunday of every week"
  monday      => "00:00-08:00,17:00-24:00",  ## Every Monday of every week"
  tuesday      => "00:00-08:00,17:00-24:00",  ## Every Tuesday of every week"
  wednesday    => "00:00-08:00,17:00-24:00",  ## Every Wednesday of every week"
  thursday    => "00:00-08:00,17:00-24:00",  ## Every Thursday of every week"
  friday      => "00:00-08:00,17:00-24:00",  ## Every Friday of every week"
  saturday    => "00:00-24:00",        ## Every Saturday of every week"
}

nagios_timeperiod { "backuptime":
  timeperiod_name => "backuptime",
  alias           => "Post Backup schedule",
  sunday          => "05:00-07:00",
  monday          => "05:00-07:00",
  tuesday         => "05:00-07:00",
  wednesday       => "05:00-07:00",
  thursday        => "05:00-07:00",
  friday          => "05:00-07:00",
  saturday        => "05:00-07:00",
}

nagios_timeperiod { "none":
  timeperiod_name => "none",
  alias           => "No Time Is A Good Time",
}


}
