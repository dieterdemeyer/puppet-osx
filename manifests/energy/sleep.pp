class osx::energy::sleep(
  $on_battery      = undef,
  $when_plugged_in = undef ) {

  if $on_battery != undef {
    exec { 'Set Time Until System Sleeps When on Battery Power':
      command => "pmset -b sleep ${on_battery}",
      user    => root,
      # onlyif  => 'pmset -g | grep -E "^\ssleep\s+0"'
    }
  }

  if $when_plugged_in != undef {
    exec { 'Set Time Until System Sleeps When Plugged In':
      command => "pmset -c sleep ${when_plugged_in}",
      user    => root,
    }
  }
}