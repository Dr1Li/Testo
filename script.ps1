Function gE1 {
    Param($a1,$b2)
    $t1 = New-Object System.Security.Cryptography.AesManaged
    $t1.KeySize = 256
    $t1.BlockSize = 128
    $t1.Mode = 1
    $t1.Padding = 2

    $t1.IV = [System.Convert]::FromBase64String(($b2[0]+$b2[1]))
    $t1.Key = [System.Text.Encoding]::UTF8.GetBytes(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String(($b2[2]+$b2[3])))).PadRight(32,"0"))

    $r = $t1.CreateEncryptor()
    $x = [System.Text.Encoding]::UTF8.GetBytes($a1)
    $e = $r.TransformFinalBlock($x,0,$x.Length)
    $o = [Convert]::ToBase64String($e)
    Write-Output ("🔒: " + $o)
}

Function uR5 {
    $p1 = ("M0" + "NJe0")
    $p2 = ("Qzb" + "TBuX1Jq" + "M18=")
    $k1 = ("SDR" + "kX0wz" + "NG1f")
    $k2 = ("RHk" + "0bDB9")

    $payload = "ZmluIGEgc2FkaTlpIHJhayBuYWRp"  # Base64 for: "Top Secret data"

    gE1 ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($payload))) @($p1,$p2,$k1,$k2)
}

