//
//  CoreDataManager.swift
//  CoredataChallenge
//
//  Created by Venkatesh Nyamagoudar on 9/1/23.
//

import CoreData
import SwiftUI
class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        self.persistentContainer = NSPersistentContainer(name: "SimpleToDoModel")
        persistentContainer.loadPersistentStores { desccription, error in
            if let error = error {
                print("Unable to initialise persistent Container: \(error)")
            }
        }
    }
}
