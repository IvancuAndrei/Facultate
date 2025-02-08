$param1 = $args[0] # Nume fisier java

$param2 = $args[1] # No of runs

# Creare fisier .csv
if (!(Test-Path outJ.csv)){
    New-Item outJ.csv -ItemType File
    #Scrie date in csv
    Set-Content outJ.csv 'Tip Paralelism, Test, Nr Threaduri,Timp executie'
}
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
$tipuri = @('SECVENTIALA', 'LINII')
$threaduri = @(@(2), @(2, 4, 8, 16), @(2, 4, 8, 16), @(2, 4, 8, 16), @(2, 4, 8, 16))
$tests = @(@(10, 10, 3), @(1000, 1000, 3), @(10, 10000, 3), @(10000, 10, 3), @(10000, 10000, 3))

for ($k = 0; $k -lt $tests.Length; $k++) {
    $suma = 0
    for ($i = 0; $i -lt $param2; $i++) {
        $input = "input_{0}_{1}_{2}.txt" -f $tests[$k][0], $tests[$k][1], $tests[$k][2]
        Write-Host "exec" $args[0] $input $tipuri[0] 1
        $a = java $args[0] $input $tipuri[0] 1
        $suma += $a
    }
    $media = $suma / $param2
    Write-Host "Timp de executie mediu:" $media
    Add-Content outJ.csv "$($tipuri[0]),$($tests[$k][0]) $($tests[$k][1]) $($tests[$k][2]),1,$($media)"
}

for ($z = 1; $z -lt $tipuri.Length; $z++) {
    for ($k = 0; $k -lt $tests.Length; $k++) {
        for ($j = 0; $j -lt $threaduri[$k].Length; $j++) {
            $suma = 0
            for ($i = 0; $i -lt $param2; $i++) {
                $input = "input_{0}_{1}_{2}.txt" -f $tests[$k][0], $tests[$k][1], $tests[$k][2]
                Write-Host "exec" $args[0] $input $tipuri[$z] $threaduri[$k][$j]
                $a = java $args[0] $input $tipuri[$z] $threaduri[$k][$j]
                $suma += $a
            }
            $media = $suma / $param2
            Write-Host "Timp de executie mediu:" $media
            Add-Content outJ.csv "$($tipuri[$z]),$($tests[$k][0]) $($tests[$k][1]) $($tests[$k][2]),$($threaduri[$k][$j]),$($media)"

        }
    }
}
