//
//  Node.swift
//  
//
//  Created by Tarun Khurana on 3/22/24.
//

import Foundation

public class Node<Type> {
    
    public var value: Type
    public var next: Node?
    
    public init(value: Type, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> \(next)"
    }
}
