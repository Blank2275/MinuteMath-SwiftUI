//
//  MinuteMath_SwiftUIApp.swift
//  MinuteMath-SwiftUI
//
//  Created by Connor Reed on 6/28/23.
//

import SwiftUI

@main
struct MinuteMath_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
