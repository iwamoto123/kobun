//
//  Correct.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/07.
//

import SwiftUI

struct CorrectView: View {
    var body: some View {
        ZStack{
         Image("backpic").resizable()  .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.5)
            Text("正解や")
        }.navigationBarBackButtonHidden(true)
    }
}

struct CorrectView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectView()
    }
}
