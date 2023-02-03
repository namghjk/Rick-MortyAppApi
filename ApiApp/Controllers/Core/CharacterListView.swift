//
//  CharacterListView.swift
//  ApiApp
//
//  Created by Nam Pham on 02/02/2023.
//

import UIKit

final class CharacterListView: UIView {

    
    @IBOutlet var ContentView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spinner)
        spinner.startAnimating()
        translatesAutoresizingMaskIntoConstraints=false
        setUpView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView(){
        Bundle.main.loadNibNamed("CharacterListView", owner: self,options: nil)
        self.addSubview(ContentView)
        ContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        ContentView.translatesAutoresizingMaskIntoConstraints = true
        ContentView.frame = bounds
        ContentView.backgroundColor = .systemBackground
    }
    
    
}
