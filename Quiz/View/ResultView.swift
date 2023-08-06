//
//  ResultView.swift
//  Quiz
//
//  Created by YA on 2023/8/5.
//

import SwiftUI

struct ResultView: View {
    
    // MARK: - Property Wrapper
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var name: String
    @Binding var answers: [String]
    @State var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .italic()
                    .padding()
                
                Text("總分：100 分")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .italic()
                    .padding()
                
                Text("🥳🥳🥳🥳🥳🥳🥳")
                    .font(.system(size: 48))
                    .padding()
                
                Text("第一屆知識問大賽獎品：")
                
                Image("玫瑰花")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .padding(.vertical, 40)
                
                Button {
                    isPresented = true
                } label: {
                    VStack(alignment: .center) {
                        Image("list")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                        
                        Text("對答案")
                            .font(.body)
                            .underline()
                            .foregroundColor(.pink)
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .sheet(isPresented: $isPresented) {
                AnswerView(answers: $answers, score: 0)
                    .presentationDetents([.medium])
            }
        }
    }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(name: .constant("Riley"), answers: .constant([""]))
    }
}
