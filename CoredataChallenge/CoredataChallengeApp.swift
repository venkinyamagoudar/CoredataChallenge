//
//  CoredataChallengeApp.swift
//  CoredataChallenge
//
//  Created by Venkatesh Nyamagoudar on 8/31/23.
//

import SwiftUI

@main
struct CoredataChallengeApp: App {
    let persisitentContainer = CoreDataManager.shared.persistentContainer
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persisitentContainer.viewContext)
        }
    }
}
