//
//  RealmManager.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//

import Foundation
import RealmSwift

class User: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var email: String = ""
}

class RealmManager {
    
    func saveData(users: [User]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(users)
            try realm.commitWrite()
            print("all good")
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
