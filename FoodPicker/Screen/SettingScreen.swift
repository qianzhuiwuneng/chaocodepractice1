//
//  SettingScreen.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/6/5.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var shouldUseDarkMode: Bool = false
    var body: some View {
        
        Form {
            Section("基本设定") {
                
                Toggle("深色模式", isOn: $shouldUseDarkMode)
            }
            Section("危险区域") {}
            
        }
    }
}

private enum Dialog: String {
    case resetSettings = "重置设定"
    case resetFoodList = "重置食物记录"
    case inactive
    
    var message: String {
        switch self {
        case .resetSettings:
            return ""
        case .resetFoodList:
            return ""
        case .inactive:
            return ""
            
        }
    }
}

struct SettingScreen_Preview: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}


