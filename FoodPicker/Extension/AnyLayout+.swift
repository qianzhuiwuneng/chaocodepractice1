//
//  AnyLayout+.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/6/3.
//
import SwiftUI
extension AnyLayout {
    static func useVStack(if condition: Bool, spacing: CGFloat, @ViewBuilder content: @escaping () -> some View) -> some View {
        let layout = condition ? AnyLayout(VStackLayout(spacing: spacing)) : AnyLayout(HStackLayout(spacing: spacing))
        
        return layout(content)
    }
}
