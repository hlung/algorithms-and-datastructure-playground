//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func LongestWord(_ sen: String) -> String {
  // steps plan:
  // - setup longestWord, wordCandidate (word)
  // - iterate through each char
  // - if it is letter, append to word
  // - if not, save word to longestWord if longer, clear word
  // - after last word is iterated, save word to longestWord if longer

  var longestWord = ""
  var word = ""

  for char in sen {
    if char.unicodeScalars.allSatisfy({ CharacterSet.letters.contains($0) }) {
      word.append(char)
    }
    else {
      if word.count > longestWord.count {
        longestWord = word
      }
      word = ""
    }
  }
  if word.count > longestWord.count {
    longestWord = word
  }

  return longestWord
}

print(LongestWord("hello world123"));
print(LongestWord("fun&!! time"));
print(LongestWord("3I love dogs"));

//: [Next](@next)
