Do {
   $annoyed = Read-host -Prompt "Are you annoyed yet [y/N]?"
   } while ( $annoyed -notlike "y*")
   "Sorry about that, friend." | out-host