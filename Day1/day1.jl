try
    file = open("Day1/input_day1.txt", "r")
    global lines = readlines(file)
    close(file)
catch e
    println("Error: $e")
end


function part1()
    left_list_sorted  = sort([parse(Int64, split(line, " ")[1]) for line in lines])
    right_list_sorted = sort([parse(Int64, split(line, " ")[4]) for line in lines])
    diff = [abs(left_list_sorted[i] - right_list_sorted[i]) for i=1:length(left_list_sorted)]
    return sum(diff)
end

println("Result part 1: ", part1())

function part2()
    left_list  = [parse(Int64, split(line, " ")[1]) for line in lines]
    right_list = [parse(Int64, split(line, " ")[4]) for line in lines]
    return sum([left for left in left_list for right in right_list if left==right])
end

println("Result part 2: ", part2())

