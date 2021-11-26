//
//  CoreDataManager.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//

import Foundation
import UIKit

class CoreDataManager {
    
    func saveHuman(name: String) {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let human = Human(context: context)
        human.name = name
        human.age = 13
        human.date = Date()
        
        app.saveContext()
    }
    
    func getHuman(by name: String) -> Human? {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let result = try? context.fetch(Human.fetchRequest()) as? [Human]
        
        return result?.first(where: { $0.name == name })
    }
    
    func getHumans() -> [Human]? {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        return try? context.fetch(Human.fetchRequest()) as? [Human]
    }
    
}
