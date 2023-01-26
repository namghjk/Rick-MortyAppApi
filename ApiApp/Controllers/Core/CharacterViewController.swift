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
        
        let request = Request(
            endpoint: .character
            ,pathComponents: ["2"]
//            ,queryParameters:[
//                URLQueryItem(name: "name", value: "rick"),
//                URLQueryItem(name: "status", value: "alive")
//            ]
        )
        print(request.url)
    }


 

}
