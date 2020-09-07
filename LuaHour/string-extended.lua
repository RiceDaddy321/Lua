quote = "Not all quotes found on the internet may be true - Abraham Lincoln. me like this. me think this is very good"

io.write("Quote Length: ", #quote, "\n")

io.write("Replace me with I: ", string.gsub( quote, "me", "I"), "\n")

io.write( "Index of the word Abraham: ", string.find(quote, "Abraham"), "\n" )

io.write( "Quote Upper Case: ", string.upper( quote ), "\n" )
io.write( "Quote lower case: ", string.lower(quote), "\n" )
