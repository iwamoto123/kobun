//
//  TestView.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/05/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedAnswer: Int?
    @State private var showResult = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text(modelData.questions.text)
                    .font(.title)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text("引用: \(modelData.questions.quote)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .italic()
                
                Text(modelData.questions.question)
                    .font(.headline)
                    .foregroundColor(.primary)
             
            
                ForEach(modelData.questions.optionlist.options) { answerlist in
                    Button {
                        selectedAnswer = answerlist.id
                        showResult = true
                    } label: {
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Text("\(answerlist.id)")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                )
                            
                            Text(answerlist.option)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
              
            }
            .padding()
            .navigationDestination(isPresented: $showResult) {
                if selectedAnswer == modelData.questions.correctedAnswer {
                    CorrectView()
                } else {
                    HintView()
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(ModelData())
    }
}
