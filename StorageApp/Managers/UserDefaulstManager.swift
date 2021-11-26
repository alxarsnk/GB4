//
//  UserDefaulstManager.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//

import Foundation

class UserDefaulstManager {
    
    let userDefaults = UserDefaults.standard
    
    func saveData(text: String, key: String) {
        userDefaults.set(text, forKey: key)
    }
    
    func getData(key: String) -> String? {
        return userDefaults.object(forKey: key) as? String
    }
    
}
