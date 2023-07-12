//
//  ContentView.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 6/28/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var appState = AppState()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 100){
                Text("Minute Math")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                NavigationLink("Play"){
                    SelectSet()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }
        }
        .environmentObject(appState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
