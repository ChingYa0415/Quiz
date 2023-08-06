//
//  AnswerView.swift
//  Quiz
//
//  Created by YA on 2023/8/6.
//

import SwiftUI

struct AnswerView: View {
    
    // MARK: - Property Wrapper
    
    @Binding var answers: [String]
    @State var score: Int
    
    // MARK: - Property
    
    var correctAnswers: [String] = ["C", "A", "D", "D", "D", "A", "C", "D", "C"]
   
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<answers.count, id: \.self) { index in
                HStack(alignment: .center, spacing: 10) {
                    Text("\(index + 1). ")
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text(answers[index] != "" ? answers[index] : correctAnswers[index])
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(answers[index] == correctAnswers[index] ? .green : .red)
                }
            }
            
            Text("實際得分： \(score)")
                .padding(.vertical, 10)
        }
        .onAppear {
            score = setScore()
        }
    }
    
    // MARK: - Method
    
    func setScore() -> Int {
        return answers.reduce(0) { rightAnswerCount, answer -> Int in
            if !correctAnswers.contains(answer) {
                return rightAnswerCount
            } else {
                return rightAnswerCount + 10
            }
        }
    }
    
}

// MARK: - Previews

struct AnswerView_Previews: PreviewProvider {
    
    static var previews: some View {
        AnswerView(answers: .constant(["A", "B", "A", "C", "C"]), score: 0)
    }
    
}
