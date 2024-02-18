# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
"""
    build(record::String) -> MyPuzzleRecordModel

Builds an instance of the `MyPuzzleRecordModel` type from a single encoded line of text in String.

### Arguments
- `record::String: A single encoded line of text.
"""
function build(record::String)::MyPuzzleRecordModel
    puzzle = MyPuzzleRecordModel()
    puzzle.record = record
    len = length(record)
    puzzle.len = len
    puzzle_array = Array{Char,1}(undef,len)
    for i in 1:len
        puzzle_array[i]= record[i] 
    end 
    puzzle.characters = puzzle_array
    return puzzle
end

# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #