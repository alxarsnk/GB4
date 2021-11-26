//
//  ViewController.swift
//  StorageApp
//
//  Created by Александр Арсенюк on 26.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    let keychainManager  = KeychainManager()
    let defaultsManager = UserDefaulstManager()
    let dataManager = DataManager()
    let coreDataManager = CoreDataManager()
    let realmManager = RealmManager()
    
    let key = "someKey"
    let imageURL = "https://ichip.ru/images/cache/2019/8/27/fit_930_519_false_crop_1200_628_0_0_q90_299852_61eb57667c.jpeg"
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        makeRequest()
//        let humans = coreDataManager.getHumans() ?? []
//        let names = humans.flatMap({$0.name}).joined()
//        dataLabel.text = coreDataManager.getHuman(by: "Alex")?.name ?? "No match"
//        imageView.image = dataManager.getImage(name: "comp.jpg")
//        let data = try? Data(contentsOf: URL(string: imageURL)!)
//        imageView.image = UIImage(data: data ?? Data())
//        dataLabel.text = keychainManager.getData(key: key)
//        dataLabel.text = defaultsManager.getData(key: key)
    }
    
    func makeRequest() {
        
        let task = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.realmManager.saveData(users: users)
            } catch(let error) {
                
                print(error)
            }
        }
        task.resume()
    }


    @IBAction func saveButtonPressed(_ sender: Any) {
        coreDataManager.saveHuman(name: textField.text ?? "No name")
        coreDataManager.saveHuman(name: "Max")
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        dataLabel.text = textField.text
    }
    
}
