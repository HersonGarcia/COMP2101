[int]$startingNumber = Read-host -Promt "Enter a number to start a countdown from your number to 1"

$mycount = $startingNumber
while ( $mycount -gt 0 ) {
  "." * ($startingNumber - $mycount) + $mycount
  $mycount--
  sleep 1
  }

  " " * $startingNumber + "Done."