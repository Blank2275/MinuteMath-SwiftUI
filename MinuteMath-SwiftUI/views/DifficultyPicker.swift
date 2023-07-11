//
//  DifficultyPicker.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 6/28/23.
//

import SwiftUI

struct DifficultyPicker: View {
    @EnvironmentObject var appState: AppState
    @Binding var setData: SetData
    @State var difficulty: Int = 0
    var body: some View {
        NavigationStack{
            VStack{
                Picker("Select a difficulty", selection: $difficulty){
                    Text("Easy").tag(0)
                    Text("Intermediate").tag(1)
                    Text("Advanced").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(20)
                
                NavigationLink("Play"){
                    QuestionView()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

struct DifficultyPicker_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyPicker(setData: .constant(SetData(name: "algebra", description: "", imageName: "", setType: .Algebra)))
    }
}
