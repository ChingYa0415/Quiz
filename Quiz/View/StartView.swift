//
//  ContentView.swift
//  Quiz
//
//  Created by YA on 2023/8/3.
//

import SwiftUI

struct StartView: View {
    
    // MARK: - Property
    
    let bloodTypes: [String] = ["A", "B", "O", "AB"]
    
    // MARK: - Property Wrapper
    
    @State var name: String = ""
    @State var dates = Date()
    @State var selectedBloodType: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Image("light ball")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("第一屆知識問答大賽")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.pink)
                    .padding()
                
                Text("說明：總共十題，及格分數為60分。")
                
                FormTextView(title: "姓名", name: $name)
                
                VStack(alignment: .leading) {
                    Text("出生年月日")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                        .foregroundColor(.pink)
                    
                    DatePicker("", selection: $dates, displayedComponents: .date)
                        .tint(.pink)
                }
                .padding()
                
                VStack {
                    Text("血型")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                        .foregroundColor(.pink)
                    
                    Picker("血型", selection: $selectedBloodType) {
                        Text(bloodTypes[0]).tag(0)
                        Text(bloodTypes[1]).tag(1)
                        Text(bloodTypes[2]).tag(2)
                        Text(bloodTypes[3]).tag(3)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .tint(.pink)
                }
                .padding()
                
                NavigationLink {
                    QuizView(name: $name)
                } label: {
                    Text("開始測驗")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .fontWeight(.black)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .controlSize(.large)
                .tint(.pink)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
}

// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        StartView()
    }
    
}
