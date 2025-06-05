//
//  ContentView.swift
//  FoodPicker
//
//  Created by Sharawadgi on 2025/5/14.
//

import SwiftUI



struct FoodPickerScreen: View {
    @State private var selectedFood: Food?
    @State private var shouldshowInfo: Bool = false
    
    let food = Food.examples
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack (spacing: 30) {
                    
                    foodImage
                    
                    Text("今天吃什么？").bold()
                    
                    selectedFoodInfoView
                    
                    Spacer().layoutPriority(1)
                    
                    selectedFoodButton
                    
                    cancelButton
                    
                }
                .padding()
                .maxWidth()
                .frame(minHeight: proxy.size.height)
                .font(.title2.bold())
                .mainButtonStyle()
                .animation(.mySpring, value: shouldshowInfo)
                .animation(.myEase, value: selectedFood)
            } .background(.bg2)
        }
    }
    
}

// MARK: - Subviews
private extension FoodPickerScreen {
    
    var foodImage: some View {
        Group {
            if let selectedFood {
                Text(selectedFood.image)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                
            } else {
                Image("dinner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 250)
            }
        }  .frame(height: 250)
    }
    var foodNameView: some View {
        HStack {
            Text(selectedFood!.name )
                .font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .id(selectedFood!.name)
                .transition(.delayInsertionOpacity)
            Button {
                shouldshowInfo.toggle()
            } label: {
                
                SFSymbol.info
                    .foregroundColor(.secondary)
            }.buttonStyle(.plain)
        }
    }
    var foodDetailView: some View {
        VStack {
            if shouldshowInfo {
                Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                    GridRow {
                        Text("蛋白质")
                        Text("脂肪")
                        Text("碳水")
                    }.frame(minWidth: 60)
                    
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                        .padding(.horizontal, -10)
                    
                    GridRow {
                        Text(selectedFood!.$carb)
                        Text(selectedFood!.$fat)
                        Text(selectedFood!.$protein)
                    }
                    
                }
                .font(.title3)
                .padding(.horizontal)
                .padding()
                .roundedRectBackground()
                .transition(.moveUpWithOpacity)
            }
        }
        .maxWidth()
        .clipped()
    }
    
    
    @ViewBuilder var selectedFoodInfoView: some View {
        if selectedFood != .none {
            foodNameView
            
        Text("热量\(selectedFood!.$calorie)").font(.title2)
            
         foodDetailView
            
        }
    }
    
    var selectedFoodButton: some View {
        
        Button(role: .none) {
            withAnimation {
                selectedFood = food.shuffled().first { $0 != selectedFood }
            }
        } label: {
            
            Text(selectedFood == .none ? "告诉我！" : "换一个").frame(width: 200)
                .animation(.none, value: selectedFood)
                .transformEffect(.identity)
        }.padding(.bottom, -15)
    }
    var cancelButton: some View {
        Button{
            withAnimation {
                selectedFood = .none
                shouldshowInfo = false
            }
        } label: {
            Text("重置").frame(width: 200)
        }.buttonStyle(.bordered)
    }
    
}
    
    extension FoodPickerScreen {
        init(selectedFood: Food){
            _selectedFood = State(wrappedValue: selectedFood)
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            FoodPickerScreen(selectedFood: .examples.first!)
            FoodPickerScreen(selectedFood: .examples.first!).previewDevice(.iPad)
            FoodPickerScreen(selectedFood: .examples.first!).previewDevice(.iPhoneSE)
        }
    }
    
    
