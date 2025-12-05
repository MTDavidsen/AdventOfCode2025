# AOC day 2 - find invalid product IDs

$data = Get-Content "\puzzle_input_2.txt"

# split by commas to get each range
$ranges = $data -split ','

[long]$total = 0

foreach ($r in $ranges) {
    $r = $r.Trim()

    # find the dash position to split start and end
    $dashPos = $r.IndexOf('-')
    [long]$start = $r.Substring(0, $dashPos)
    [long]$end = $r.Substring($dashPos + 1)

    # check each number in the range
    for ([long]$n = $start; $n -le $end; $n++) {
        $s = $n.ToString()
        $length = $s.Length

        # try all possible pattern lengths
        $invalid = $false

        for ($patternLen = 1; $patternLen -le $length / 2; $patternLen++) {
            # pattern length must divide evenly into total length
            if ($length % $patternLen -eq 0) {
                $pattern = $s.Substring(0, $patternLen)
                $repeats = $length / $patternLen

                # build what the number would be if this pattern repeated
                $expected = $pattern * $repeats

                if ($s -eq $expected) {
                    $invalid = $true
                    break
                }
            }
        }

        if ($invalid) {
            $total += $n
        }
    }
}

Write-Host "sum: $total"