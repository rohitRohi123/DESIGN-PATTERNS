//
//  Iterator Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 21/09/22.
//

import Foundation

protocol Iterator {
    associatedtype Element
    func next()-> Element?
    func hasNext()-> Bool
}

fileprivate protocol NodeProtocol {
    associatedtype Element;
    var value: Element {get set}
    
    var hasVisited: Bool {get set}
}

class TreeNode<Item>: NodeProtocol {
    fileprivate(set) var value: Item
    fileprivate(set) var hasVisited: Bool = false
    fileprivate(set) var leftNode: TreeNode<Item>? = nil
    fileprivate(set) var rightNode: TreeNode<Item>? = nil
    
    init(value: Item) {
        self.value = value
    }
    
    func updateVisitedStatus() {
        self.hasVisited = true
    }
    
}

class MyCollection<Element> {
    private var tree: [TreeNode<Element>] = []
    
    var head: TreeNode<Element>? {
        return tree.count > 0 ? tree[0] : nil
    }
    
    init(elements: [Element]) {
        self.prepareTree(with: elements)
    }

    lazy var iterator: MyCollectionIterator<Element>? = {
        guard let head = head else {
            return nil
        }

        return MyCollectionIterator(head: head)
        
    }()
    
    private func prepareTree(with elements: [Element]) {
        guard elements.count > 0 else {return}
        
        var i = 0
        
        repeat {
            guard 2*i < elements.count else {break; }
            let rootNode: TreeNode<Element> = self.getRootNode(with: elements[i], index: 2*i)
            
            if 2*i + 1 < elements.count {
                let leftNode = TreeNode<Element>(value: elements[2*i + 1])
                rootNode.leftNode = leftNode
                self.tree.append(leftNode)
                
            }
            
            if 2*i + 2 < elements.count {
                let rightNode = TreeNode<Element>(value: elements[2*i + 2])
                rootNode.rightNode = rightNode
                self.tree.append(rightNode)
             
            }
            
            i += 1
        }while(i < elements.count)
    
        for treeObject in tree {
            debugPrint("Element value = \(treeObject.value)")
        }
    }

    private func getRootNode(with element: Element, index: Int)-> TreeNode<Element> {
        if self.tree.count > index  {
            return self.tree[index]
        }
        
        let head = TreeNode<Element>(value: element)
        self.tree.append(head)
        return head
    }
}

class MyCollectionIterator<Item>: Iterator {
    typealias Element = TreeNode<Item>
    
    private let head:TreeNode<Item>
    private var hasNextElement: Bool = false
    
    init(head: TreeNode<Item>) {
        self.head = head
    }
    
    func next()-> Element? {
        guard self.head.leftNode != nil,
              self.head.rightNode != nil else {
            hasNextElement = false
            return nil
        }
        
        // Later complete all tree case
        // All leaf node should have reference of the parent node
        
        self.head.updateVisitedStatus()
        if let leftNode = self.head.leftNode,
           leftNode.hasVisited == false {
            leftNode.hasVisited = true
            return leftNode
        }
        
        if let rightNode = self.head.rightNode,
           rightNode.hasVisited == false {
            rightNode.hasVisited = true
            return rightNode
        }
        
        self.hasNextElement = false
        return nil
    }
    
    func hasNext()-> Bool {
        return hasNextElement
    }
}

/*
 Client Code
 let tree: MyCollection<String> = MyCollection<String>(elements: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q","r"])
 let iterator = tree.iterator
 debugPrint("Iterator next value = \(iterator?.next()?.value)")
 */
