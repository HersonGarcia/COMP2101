function operatingsystem {
"Operating System Info:"
$operatingsys = gwmi -class win32_operatingsystem |
   foreach {
    new-object -Typename psobject -Property @{
        "Operating System" = $_.caption
        Version = $_.version
        }
  }     | 
  format-list     
  $operatingsys 
  }
  operatingsystem