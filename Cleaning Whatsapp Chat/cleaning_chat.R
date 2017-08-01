library(tm)

#Create Corpus with all documents in the directory
#From WhatsAppChat/. change it to the folders name where the chat text file is
docs <- Corpus (DirSource ("WhatsAppChat/.")) 
docs

getTransformations()

#create the toSpace content transformer
toSpace <- content_transformer(function(x, pattern) {return (gsub(pattern, "", x))})

#Remove basic punctuations and some 
#random symbols that smileys will be converted to
docs <- tm_map(docs, toSpace, "-")
docs <- tm_map(docs, toSpace, ":")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, " -")
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, ",")
docs <- tm_map(docs, toSpace, '"')
docs <- tm_map(docs, toSpace, "'")
docs <- tm_map(docs, toSpace, "~")
docs <- tm_map(docs, toSpace, "¶")
docs <- tm_map(docs, toSpace, "^")
docs <- tm_map(docs, toSpace, "T")
docs <- tm_map(docs, toSpace, "«")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "  ")
docs <- tm_map(docs, toSpace, "  ")

#Remove name of group members
#My group had 7 members
docs <- tm_map(docs, toSpace, "Member1")
docs <- tm_map(docs, toSpace, "Member2")
docs <- tm_map(docs, toSpace, "Member3")
docs <- tm_map(docs, toSpace, "Member4")
docs <- tm_map(docs, toSpace, "Member5")
docs <- tm_map(docs, toSpace, "Member6")
docs <- tm_map(docs, toSpace, "Member7")

# Exported chat was without media. 
docs <- tm_map(docs, toSpace, "<media omitted>")

#Transform to lower case (need to wrap in content_transformer)
docs <- tm_map(docs,content_transformer(tolower))

#Strip digits (std transformation, so no need for content_transformer)
docs <- tm_map(docs, removeNumbers)

# Replace the typos with their original meaning. 
# This is somewhat a manual process. One needs to search for typos
docs <- tm_map(docs, content_transformer(gsub), pattern = "organiz", replacement = "organ")
docs <- tm_map(docs, content_transformer(gsub), pattern = "th", replacement = "the")
docs <- tm_map(docs, content_transformer(gsub), pattern = "andgovern", replacement = "govern")
docs <- tm_map(docs, content_transformer(gsub), pattern = "inenterpris", replacement = "enterpris")
docs <- tm_map(docs, content_transformer(gsub), pattern = "tum", replacement = "tomorrow")

#Checking if the above method was succesful or not
writeLines(as.character(docs))

#Saving the file
writeLines(as.character(docs), con="mycorpus.txt")

