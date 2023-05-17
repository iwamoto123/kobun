//
//  QuestionsView.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/03.
//

import SwiftUI

struct QuestionsView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var checkAnswer: Bool = false
    
    var body: some View {
        VStack{
            Text(modelData.questions.text)
            Text(modelData.questions.question)
            
            if checkAnswer {
                CorrectView()
            } else {
                HintView()
            }
            
            ForEach(modelData.questions.optionlist.answers){ answer in
                Button {
                    if answer.id == 1
                    {
                        checkAnswer = true                    }
                } label: {
                    Text(answer.answer)
                }

            }
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView().environmentObject(ModelData())
    }
}
