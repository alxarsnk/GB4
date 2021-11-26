//
//  FileManager.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//

import Foundation
import UIKit

class DataManager {
    
    func saveImage(image: UIImage, name: String) {
        let imageData = image.jpegData(compressionQuality: 1)
        guard let dir = try? FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        try? imageData?.write(to: dir.appendingPathComponent(name))
        print("Successful save")
    }
    
    func getImage(name: String) -> UIImage? {
        guard let dir = try? FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = dir.appendingPathComponent(name)
        return UIImage(contentsOfFile: url.path)
    }
    
}
