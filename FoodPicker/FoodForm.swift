//
//  FoodForm.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/5/26.
//

import SwiftUI

extension FoodListView {
    struct FoodForm: View {
        var body: some View {
            VStack {
                Label("编辑食物资讯", systemImage: "pencil")
                    .font(.title.bold())
                    .foregroundColor(.accentColor)
                
                
                Form {
                    Section {
                        Text("ABC")
                        Text("ABC")
                    } header: {
                        Text("Header")
                    } footer: {
                        Text("Footer")
                    }
                }
            }
        }
    }
}

struct FoodForm_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView.FoodForm()
    }
    
}
