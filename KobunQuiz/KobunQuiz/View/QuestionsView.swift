//
//  QuestionsView.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/03.
//

import SwiftUI

struct QuestionsView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var selectedAnswer: Int?
    @State private var showResult = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backpic").resizable()
                    .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .opacity(0.5)
                
                
                VStack{
                    VStack{
                        Text(modelData.questions.text)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .padding()
                    
                        Text("引用: \(modelData.questions.quote)")
                            .frame(alignment: .trailing)
                        
                    }.background(
                        RoundedRectangle(cornerRadius: 10)
                         .foregroundColor(Color.white).opacity(0.8)
                         .shadow(radius: 4)).padding(.horizontal, 10)
                    
                    Text(modelData.questions.question)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(
                               RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue).opacity(0.8)
                                   .shadow(radius: 4))
                       
                    
                    ForEach(modelData.questions.optionlist.options){ answerlist in
                        Button {
                            selectedAnswer = answerlist.id
                            showResult = true
                        } label: {
                            ZStack(alignment: .leading) {
                                
                                Text(answerlist.option)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.blue)
                                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)
                                    )
                                    .padding(.horizontal, 30)
                                
                                Text("\(answerlist.id)")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .alignmentGuide(.leading){ _ in -40 }
                            }
                        }
                    }
                }.navigationDestination(isPresented: $showResult) {
                    if selectedAnswer == modelData.questions.correctedAnswer {
                        CorrectView()
                    } else {
                        HintView()
                    }
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
