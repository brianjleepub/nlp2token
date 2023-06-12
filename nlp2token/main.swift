//
//  mainNot.swift
//  nlp2token
//
//  Created by Brian Lee on 13/6/2023.
//

import Foundation
import NaturalLanguage

// Check if there are command line arguments
guard CommandLine.arguments.count > 1 else {
    print("Error: Please provide a sentence to tokenize.")
    exit(1)
}

// Join the command line arguments into a single string
let inputSentence = CommandLine.arguments.dropFirst().joined(separator: " ")

// Check if the input sentence is not empty after trimming whitespace and newlines
let trimmedSentence = inputSentence.trimmingCharacters(in: .whitespacesAndNewlines)
guard !trimmedSentence.isEmpty else {
    print("Error: The provided sentence is empty or only contains whitespace.")
    exit(1)
}

// Create an instance of NLTokenizer, specifying that we want to tokenize the input into words.
let tokenizer = NLTokenizer(unit: .word)

// Assign the input sentence to the tokenizer's string property. This is the text that will be tokenized.
tokenizer.string = trimmedSentence

// Initialize an index variable to keep track of the token numbers.
var index = 0

// Call the enumerateTokens method on the tokenizer. This method takes a range (in this case, the full range of the input sentence)
// and a closure. The closure is called once for each token in the input sentence, with the token's range and an optional reference to the token.
tokenizer.enumerateTokens(in: trimmedSentence.startIndex..<trimmedSentence.endIndex) { (range, _) -> Bool in
    // Print the token number and the token itself. The token is obtained by using the range to index into the input sentence.
    print("Index: \(index). Token: \(trimmedSentence[range])")
    
    // Increment the token number for the next token.
    index += 1
    
    // The closure returns a Bool that indicates whether enumeration should continue.
    // Returning true continues enumeration, returning false stops enumeration.
    return true
}
