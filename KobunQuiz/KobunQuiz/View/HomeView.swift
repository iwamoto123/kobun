//
//  HomeView.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/05.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: QuestionsView()){
            ZStack{
                Image("backpic").resizable()  .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                Text("スタート").font(.largeTitle)
                    .padding(20)
                    .foregroundColor(.white)
                    .background(Color.blue.cornerRadius(20))
            }
            .navigationBarTitle("古文100本ノック")
        }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
