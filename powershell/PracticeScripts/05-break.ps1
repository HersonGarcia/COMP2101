$var = 1..7
$othervar = 5

switch ( $var ) {
3 {
    "var is three"
    continue
    }
$othervar {
            "var matches othervar - Im done"
            break
            }
default {
          "I dont test if var is '$_'"
          }
}