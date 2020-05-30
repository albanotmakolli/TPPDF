//
//  Array+PDFJSONSerializable.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 30.05.19.
//

import Foundation

/**
 TODO: Documentation
 */
extension Array: PDFJSONSerializable {

    /**
     TODO: Documentation
     */
    public var JSONRepresentation: AnyObject {
        var representation: [Any] = []

        for (value) in self {
            representation.append(convertValue(value))
        }

        return representation as NSArray
    }

}

extension Sequence {
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
}
