//
//  KeychainManager.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//

import Foundation
import SwiftKeychainWrapper

class KeychainManager {
    
    func saveData(text: String, key: String) {
        KeychainWrapper.standard.set(text, forKey: key)
    }
    
    func getData(key: String) -> String? {
        return KeychainWrapper.standard.string(forKey: key)
    }
    
}
