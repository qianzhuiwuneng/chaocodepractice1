//
//  ShapeStyleView.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/5/23.
//

import SwiftUI

struct ShapeStyleView: View {
    var body: some View {
        VStack {
            //Circle().fill(.teal)
            // Circle().fill(.teal.gradient)
            Circle().fill(.yellow)
            
            Circle().fill(.image(.init("dinner"), scale: 0.2))
                .zIndex(1)
            
            Text("Hello")
                .font(.system(size:100).bold())
                .foregroundStyle(.linearGradient(colors: [.pink, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: .white, radius: 10)
                .shadow(color: .white, radius: 10)
                .shadow(color: .white, radius: 10)
                .background {
                    Color.bg2
                        .scaleEffect(x: 1.5, y: 1.3)
                        .blur(radius: 20)
        }
            
        }
    }
}


struct ShapeStyleView_Preview: PreviewProvider {
    static var previews: some View {
        ShapeStyleView()
    }
}
