$var = 0..7
$limit = 4

switch ( $var ) {
3 {
    "var is three"
    continue
    }
  {($_ -gt $limit)} {
            "'$_' is more than my limit of $limit - Im done"
            break
            }
  { ( $_ -is [int]) -and ( (get-date).dayofweek -eq $_ ) } {
                                                "'$_' is todays day of the week"
                                                          }

default {
        "I dont test if var is '$_'"
        }
}