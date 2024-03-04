//
//  ContentView.swift
//  Calculator
//
//  Created by StudentAM on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @State var newArray: [[String]] = [
            ["AC","+/-", "%", "÷"],
            ["7","8", "9", "x"],
            ["4","5", "6", "-"],
            ["1","2", "3", "+"],
            ["0", " . " , "="]
        ]
//        Color.black.ignoresSafeArea()
        VStack {
            HStack
            {
                ForEach(newArray[0].indices, id: \.self) { index in
                    // Your code here
                }
            }
            HStack
            {
                ForEach(newArray[1].indices, id: \.self) { index in
                    // Your code here
                }
            }
            HStack
            {
                ForEach(newArray[2].indices, id: \.self) { index in
                    // Your code here
                }
            }
            HStack
            {
                ForEach(newArray[3].indices, id: \.self) { index in
                    // Your code here
                }
            }
            HStack
            {
                ForEach(newArray[4].indices, id: \.self) { index in
                    // Your code here
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
