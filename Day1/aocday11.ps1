# day 1 solver

$input = Get-Content .\puzzle_input.txt

# part 1
$pos = 50
$count = 0

foreach ($line in ($input -split "`n")) {
    if ($line.Trim() -eq "") { continue }
    
    $dir = $line[0]
    $num = [int]$line.Substring(1)
    
    if ($dir -eq 'L') {
        $pos -= $num
    } else {
        $pos += $num
    }
    
    $pos = $pos % 100
    if ($pos -lt 0) { $pos += 100 }
    
    if ($pos -eq 0) { $count++ }
}

Write-Host "part 1: $count"

# part 2 - count every click that hits 0
$pos = 50
$total = 0

foreach ($line in ($input -split "`n")) {
    if ($line.Trim() -eq "") { continue }
    
    $dir = $line[0]
    $num = [int]$line.Substring(1)
    
    for ($i = 0; $i -lt $num; $i++) {
        if ($dir -eq 'L') {
            $pos--
            if ($pos -lt 0) { $pos = 99 }
        } else {
            $pos++
            if ($pos -ge 100) { $pos = 0 }
        }
        
        if ($pos -eq 0) { $total++ }
    }
}

Write-Host "part 2: $total"