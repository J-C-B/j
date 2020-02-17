$domains=Get-AcceptedDomain
Get-Mailbox -Identity * \
| where {$_.forwardingsmtpaddress -ne $null} \
| % {$domain=((($_.forwardingsmtpaddress -split "SMTP:")[1]) -split "@")[1];$_} \
| where {$domains.DomainName -notcontains $domain} \
| %{Write-Host "$($_.userprincipalname) : $($_.forwardingsmtpaddress)"}
