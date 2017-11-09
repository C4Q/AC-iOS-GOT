//: Playground - noun: a place where people can play

import Cocoa

struct Stack2<T> {//structs have immutable as self
    private var arr: [T] = []// ony we can access this
    mutating func push(_ newElement: T) -> T? {
        arr.append(newElement)
        return newElement
    }
    mutating func pop() -> T? {
        return arr.popLast()
        //TO DO Check for nil
    }
    func peek() -> T? {
        return arr.last
    }
    var isEmpty: Bool {
        return arr.count == 0
        //return arr.isEmpty
    }
}

class Node<T> {
    var val: T
    var next: Node?
    init(val: T) {
        self.val = val
    }
}

struct Stack<T> {//structs have immutable as self
    var head: Node<T>?
    mutating func push(_ newElement: T) {
        let newHead = Node(val: newElement)
        newHead.next = self.head
        self.head = newHead
    }
    mutating func pop() -> T? {
        guard let oldHead = head else {
            return nil
        }
        self.head = oldHead.next
        return oldHead.val
        
    }
    func peek() -> T? {
        return head?.val
        
    }
    var isEmpty: Bool {
        return head == nil
    }
}

var myStack: Stack<Int> = Stack()
myStack.push(5)
myStack.push(10)
myStack.push(15)
myStack.pop()
myStack.peek()
myStack.isEmpty

func printAllValues<T: CustomStringConvertible>(in stack: Stack<T>) {
    var stack = stack
    while !stack.isEmpty {
        print(stack.pop()!)
    }
}
printAllValues(in: myStack)


