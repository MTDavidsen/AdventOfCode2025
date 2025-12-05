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

        # must be even length
        if ($length % 2 -eq 0) {
            $half = $length / 2
            $left = $s.Substring(0, $half)
            $right = $s.Substring($half)

            # if both halves match, it's invalid
            if ($left -eq $right) {
                $total += $n
            }
        }
    }
}

Write-Host "sum: $total"