//
//  FormTextView.swift
//  Quiz
//
//  Created by YA on 2023/8/3.
//

import SwiftUI

struct FormTextView: View {
    
    // MARK: - Property
    
    let title: String
    
    // MARK: - Property Wrapper
    
    @Binding var name: String
    @FocusState var isEditing: Bool
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontDesign(.rounded)
                .fontWeight(.black)
                .foregroundColor(.pink)
            
            TextField("請輸入", text: $name)
                .font(.headline)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.done)
                .focused($isEditing)
                .padding(.horizontal, 10)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("確定") {
                            isEditing = false
                        }
                    }
                }
        }
        .padding()
    }
    
}

// MARK: - Previews

struct FormTextView_Previews: PreviewProvider {
    
    static var previews: some View {
        FormTextView(title: "姓名", name: .constant(""))
    }
    
}
