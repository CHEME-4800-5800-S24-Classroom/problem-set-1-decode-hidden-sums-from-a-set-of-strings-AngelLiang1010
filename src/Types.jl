"""
    MyPuzzleRecordModel

Mutable struct with three fields:
record::String -field holds a single encoded line of text
characters:Array{Char,1} - field holds the characters of the line of text
len::Int64 - field which holds the length (number of characters) of the encoded line of text

"""

mutable struct MyPuzzleRecordModel
    record::String
    characters::Array{Char,1}
    len::Int64
    MyPuzzleRecordModel()=new()
end