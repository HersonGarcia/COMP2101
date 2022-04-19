$var = 1..7
$othervar = 3

switch ( $var ) {
3 {
    "var is three"
    continue
    }
$othervar {
            "var is the same as othervar"
            continue
            }
default {
          "I dont test if var is '$_'"
          }
}