//
//  CharacterViewController.swift
//  ApiApp
//
//  Created by Nam Pham on 02/02/2023.
//

import UIKit

class CharacterViewController: UIViewController {

    
    @IBOutlet weak var CharacterListView: CharacterListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character"
        
        CharacterListView.spinner.startAnimating()
      
        
        Services.shared.execute(.listAllCharactersResquests, expecting: GetAllCharaterResponse .self) { result in
            switch result {
            case .success(let model):
                print("Total: " + String(model.info.count))
                print("Pages result count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
      
    }

}
