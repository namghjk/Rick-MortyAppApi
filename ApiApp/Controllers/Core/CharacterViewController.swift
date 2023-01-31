//
//  CharacterViewController.swift
//  ApiApp
//
//  Created by Nam Pham on 19/01/2023.
//

import UIKit

//Controller to show and find character
class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character"
  
        Services.shared.execute(.listAllCharactersResquests, expecting: GetAllCharaterResponse .self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Pages result count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
                print("123")
            }
        }
      
    }
  
}
