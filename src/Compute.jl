# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This method takes a dictionary of encoded line of text. For each encoded line of text, the first digit will be the 
integer first appearing in the line, and the last digit will be the interger last appearing in the line. The first
digit and the last digit will combine to form a 2-digit integer. The integers for each line will add together to get
a hidden sum. The hidden sum will be returned.

###Arguments
models::Dict{Int64,MyPuzzleRecordModel}: A dictionary containing every line of text that needs to be encoded.
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    
    #check if each character is a number or not
    N = length(models)
    for i ∈ 1:N
        first = true
        firstdigit = 0
        lastdigit = 0
        for j in models[i].characters
            if isdigit(j) & first
                firstdigit = parse(Int64,j)
                first = false
            end 
            if isdigit(j) 
                lastdigit = parse(Int64,j)
            end 
        end
        codes[i] = 10*firstdigit + lastdigit
        total += codes[i]
    end
    # return the total -
    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This method takes a dictionary of encoded line of text. For each encoded line of text, the first digit will be the 
integer or the word of number spelled out first appearing in the line, and the last digit will be the interger or the word 
of number spelled out last appearing in the line. If it is a word of number spelled out, it will be converted to the interger
form of that number. The first digit and the last digit will combine to form a 2-digit integer. The integers for each line 
will add together to get a hidden sum. The hidden sum will be returned.
    
###Arguments
models::Dict{Int64,MyPuzzleRecordModel}: A dictionary containing every line of text that needs to be encoded.
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
     
    # check if integers and numbers spelled out in words are in the line of text
    N = length(models)
    for i ∈ 1:N
        first = true
        firstdigit = 0
        lastdigit = 0
        index =length(models[i].record)
        for j ∈ 1:index
            if findfirst("one",models[i].record[j:index]) == 1:3
                if first
                    firstdigit = 1
                    first = false
                end
                lastdigit = 1
            end
            if findfirst("two",models[i].record[j:index]) == 1:3
                if first
                    firstdigit = 2
                    first = false
                end
                lastdigit = 2
            end
            if findfirst("three",models[i].record[j:index]) == 1:5
                if first
                    firstdigit = 3
                    first = false
                end
                lastdigit = 3
            end   
            if findfirst("four",models[i].record[j:index]) == 1:4
                if first
                    firstdigit = 4
                    first = false
                end 
                lastdigit = 4
            end
            if findfirst("five",models[i].record[j:index]) == 1:4
                if first
                    firstdigit = 5
                    first = false
                end
                lastdigit = 5
            end
            if findfirst("six",models[i].record[j:index]) == 1:3
                if first
                    firstdigit = 6
                    first = false
                end
                lastdigit = 6
            end
            if findfirst("seven",models[i].record[j:index]) == 1:5
                if first
                    firstdigit = 7
                    first = false
                end
                lastdigit = 7
            end
            if findfirst("eight",models[i].record[j:index]) == 1:5
                if first
                    firstdigit = 8
                    first = false
                end
                lastdigit = 8
            end
            if findfirst("nine",models[i].record[j:index]) == 1:4
                if first
                    firstdigit = 9
                    first = false
                end
                lastdigit = 9
            end
            if isdigit(models[i].record[j])
                if first
                    firstdigit = parse(Int64,models[i].record[j])
                    first = false
                end
                lastdigit = parse(Int64,models[i].record[j])
            end
        end
        codes[i]= firstdigit*10+lastdigit
        total += codes[i]
    end
     # return the total -
     return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #