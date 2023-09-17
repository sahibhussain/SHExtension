//
//  Binding+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 28/04/22.
//

import SwiftUI

extension Binding {
    
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
    
}
