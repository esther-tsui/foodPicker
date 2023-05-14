//
//  ContentView.swift
//  foodPicker
//
//  Created by Wing Hei Tsui on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    let food = ["漢堡", "沙拉", "披薩", "義大利麵", "雞腿便當", "刀削麵", "火鍋", "牛肉麵", "關東煮"]
    @State private var selectedFood: String?
    
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("What to eat today?")
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .id(selectedFood)
                    .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2)), removal: .opacity).animation(.easeInOut(duration: 0.4)))
            }
            
            Button {
                selectedFood = food.shuffled().first
            } label: {
                Text(selectedFood == .none ? "Tell me!" : "Next").frame(width: 200)
                    .transformEffect(.identity)
            }.padding(.bottom, -15)
            
            Button {
                selectedFood = .none
            } label: {
                Text("Reset!").frame(width: 200)
            }.buttonStyle(.bordered)
            
        }
        .frame(maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .animation(.easeInOut, value: selectedFood)
        .padding()
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
