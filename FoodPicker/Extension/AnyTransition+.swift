//
//  Untitled.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/6/3.
//

import SwiftUI
extension AnyTransition {
    static let moveUpWithOpacity = Self.move(edge: .top).combined(with: .opacity)
    
    static let moveLeadingWithOpacity = Self.move(edge: .leading).combined(with: .opacity)
    
    static let delayInsertionOpacity = Self.asymmetric(
        insertion: .opacity
                    .animation(.easeInOut(duration: 0.5).delay(0.2)),
        removal: .opacity
                    .animation(.easeInOut(duration: 0.4)))
}
