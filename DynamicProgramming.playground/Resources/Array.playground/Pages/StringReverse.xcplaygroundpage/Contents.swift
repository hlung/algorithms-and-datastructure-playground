import UIKit

var greeting = "Hello, playground"

func reverse(_ string: String) -> String {
  var result = ""
  for char in string {
    result = String(char) + result
  }
  return result
}
print (reverse("!pleH"))

