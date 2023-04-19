//
//  TextSUIApp.swift
//  TextSUI
//
//  Created by Денис Мишин on 30.03.2023.
//

import SwiftUI

@main
struct TextSUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LinkView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
