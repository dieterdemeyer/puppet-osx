# Public: Sets the repeat rate for held keys.
#
# rate - the delay between key 'presses'. Defaults to 0.
#
# Examples
#
#   # set the repeat rate to 0 (the default)...
#   include osx::keyboard::key_repeat_rate
#
#   # ...or pick your own repeat rate!
#   class { 'osx::keyboard::key_repeat_rate':
#     rate => 2
#   }
class osx::keyboard::key_repeat_rate($rate = 10) {
  if is_integer($rate) {
    boxen::osx_defaults { 'key repeat rate':
      user   => $::boxen_user,
      domain => 'NSGlobalDomain',
      key    => 'KeyRepeat',
      value  => $rate,
    }
  }
}
