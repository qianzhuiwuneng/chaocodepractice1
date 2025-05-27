//
//  SuffixWarpper.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/5/23.
//
@propertyWrapper struct Suffix: Equatable {
    var wrappedValue: Double
    private let suffix: String
    
    init(wrappedValue: Double, _ suffix: String) {
        self.wrappedValue = wrappedValue
        self.suffix = suffix
    }
    
    var projectedValue: String {
        
        wrappedValue.formatted() + " \(suffix)"
    }
}
