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
                
            Text("Waht to eat today?")
                .font(.title)
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }


            Button("Tell me!") {
                selectedFood = food.shuffled().first
            }.font(.title)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .animation(.easeInOut, value: selectedFood)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
