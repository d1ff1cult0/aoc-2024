try
    file = open("Day2/input_day2.txt", "r")
    global lines = readlines(file)
    global lines_int = [[parse(Int64, x) for x in split(line, " ")] for line in lines]
    close(file)
catch e
    println("Error: $e")
end

function part1()
    strictly_increasing_or_decreasing = [report for report in lines_int 
                                        if all(report[i] > report[i-1] for i in 2:length(report)) || 
                                           all(report[i] < report[i-1] for i in 2:length(report))]
    no_jumps_bigger_than_3 = [report for report in strictly_increasing_or_decreasing
                              if all(abs(report[i]-report[i-1]) <= 3 for i in 2:length(report))]
    return length(no_jumps_bigger_than_3)
end

println(part1())

function part2()
    strictly_increasing_or_decreasing = [(report, min(sum([1 for i in 2:length(report) if !all(report[i] < report[j] for j in 1:i-1)]), 
                                                      sum([1 for i in 2:length(report) if !all(report[i] > report[j] for j in 1:i-1)]))) 
                                        for report in lines_int]
    no_jumps_bigger_than_3 = [(report, faults+sum([1 for i in 2:length(report) if abs(report[i]-report[i-1]) > 3])) 
                             for (report, faults) in strictly_increasing_or_decreasing]
    return sum([1 for (report, faults) in no_jumps_bigger_than_3 if faults <= 1])
end

println(part2())