import UIKit

var greeting = "Hello, playground"

let node2 = Node(value: 2, next: nil)
let node1 = Node(value: 1, next: node2)

print(node1.value)
print(node1.next?.value)
