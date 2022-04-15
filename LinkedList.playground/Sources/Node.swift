import Foundation

public class Node<T> {
  public init(value: T, next: Node<T>? = nil) {
    self.value = value
    self.next = next
  }

  public let value: T
  public let next: Node<T>?
}

