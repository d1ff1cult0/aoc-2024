try
    file = open("Day3/input_day3.txt", "r")
    global lines = readlines(file)
    close(file)
catch e
    println("Error: $e")
end

function part1()
    pattern = r"mul\((\d{1,3}),(\d{1,3})\)"
    matches = [m for line in lines for m in eachmatch(pattern, line)]
    multiplications = [parse(Int, m.captures[1])*parse(Int, m.captures[2]) for m in matches]
    return sum(multiplications)
end

println("Part 1: ", part1())

function part2()
    lines_concat = join(lines, "")
    pattern = r"mul\((\d{1,3}),(\d{1,3})\)"
    do_indices =   [m.offset for m in eachmatch(r"do\(\)",    lines_concat)]
    dont_indices = [m.offset for m in eachmatch(r"don't\(\)", lines_concat)]
    matches = eachmatch(pattern, lines_concat)
    multiplications = [parse(Int, m.captures[1])*parse(Int, m.captures[2]) for m in matches
                        if maximum([0; do_indices[do_indices .< m.offset]]) > maximum([-1; dont_indices[dont_indices .< m.offset]])]
    return sum(multiplications)
end

println("Part 2: ", part2())
