//
//  SelectSet.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 6/28/23.
//

import SwiftUI

struct SelectSet: View {
    @EnvironmentObject var appState: AppState
    @State var sets = testSetData
    
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .center, spacing: 20){
                    ForEach($sets){ mathSet in
                        MathSetCard(setData: mathSet)
                    }
                }
            }
        }
    }
}

struct MathSetCard: View {
    
    @Binding var setData: SetData
    var body: some View {
            VStack{
                Image(setData.imageName)
                    .resizable()
                    .frame(width: 200, height: 200)
                NavigationLink(setData.name, destination: DifficultyPicker(setData: $setData))
                    .font(.system(size: 30))
                    .buttonStyle(.bordered)
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 200, height:5)
                    .padding(20)
                    .blur(radius: 10)
        }
    }
}

struct SelectSet_Previews: PreviewProvider {
    static var previews: some View {
        SelectSet()
    }
}
