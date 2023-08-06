//
//  FormOptionView.swift
//  Quiz
//
//  Created by YA on 2023/8/4.
//

import SwiftUI

struct FormOptionView: View {
    
    // MARK: - Property Wrapper
    
    @Binding var selectedAnswer: String
    
    // MARK: - Property
    
    var option: String
    var optionText: String?
    var optionImage: String?
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Button {
                selectedAnswer = option
            } label: {
                Image(selectedAnswer == option ? "circle check" : "circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .padding(.horizontal, 10)

            if optionText != nil {
                Text("\(option). \(optionText!)")
                    .font(.title3)
            } else if optionImage != nil {
                HStack(alignment: .top) {
                    Text("\(option). ")
                        .font(.title3)
                    
                    Image(optionImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
    
}

struct FormOptionView_Previews: PreviewProvider {
    static var previews: some View {
        FormOptionView(selectedAnswer: .constant("B"), option: "A", optionText: "落日飛車")
    }
}
