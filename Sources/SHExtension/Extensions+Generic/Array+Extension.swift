//
//  Array+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 22/03/22.
//

import Foundation

extension Array {
    
    public mutating func safeRemove(at index: Int) {
        if self.count > index && index >= 0 {
            self.remove(at: index)
        }
    }
    
    public mutating func safeInsert(_ obj: Element , at index: Int) {
        if (index <= self.count) && (index >= 0) {
            self.insert(obj, at: index)
        }
    }
    
    public mutating func safeReplace(_ element: Element, at index: Int) {
        safeInsert(element, at: index)
        safeRemove(at: index+1)
    }
    
    @discardableResult
    public func safeItem(at index: Int) -> Element? {
        if self.count > index && index >= 0 {
            return self[index]
        }
        return nil
    }
    
}
