(1..10) | 
    foreach {
      New-Object -TypeName psobject -Property @{ 
            NumberOfDigits=$_
            MaxValuewithBinary=[math]::Pow(2,$_)
            MaxValuewithOctal=[math]::Pow(8,$_)
            MaxValuewithHexadecimal=[math]::Pow(16,$_)
            }
        }
   Format-Table -AutoSize NumberofDigits, MaxValuewithBinary, MaxValuewithOctal,  MaxValuewithHexadecimal 
