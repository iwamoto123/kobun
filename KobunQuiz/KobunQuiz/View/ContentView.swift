//
//  ContentView.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("backpic").resizable()  .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.5)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
