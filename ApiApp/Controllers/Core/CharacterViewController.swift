//
//  CharacterViewController.swift
//  ApiApp
//
//  Created by Nam Pham on 02/02/2023.
//

import UIKit

class CharacterViewController: UIViewController {

  
    
    @IBOutlet weak var CharacterListView: CharacterListView!
    
    private let viewModel = CharacterListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Character"
        
        
        //spinner
        CharacterListView.spinner.startAnimating()
    
        
        
        //CollectionView
        setUpCollectionView()
        
        //Show UP collectionView
        AppearCollectionView()
        
       
        
      
    }
    
    
    
    //setUpCollectionView
    private func setUpCollectionView(){
        self.viewModel.fetchCharacters()
        CharacterListView.CollectionView.isHidden = true
        CharacterListView.CollectionView.alpha = 0
        
        
        
    }
    
    
    //Hide spinner and Show up CollectionView
    private func AppearCollectionView(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            
            self.CharacterListView.spinner.stopAnimating()
            self.CharacterListView.CollectionView.isHidden = false
            UIView.animate(withDuration: 0.4){
                self.CharacterListView.CollectionView.alpha = 1.0
                self.CharacterListView.CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
                self.CharacterListView.CollectionView.delegate =  self.viewModel
                self.CharacterListView.CollectionView.dataSource = self.viewModel
            }
        })
    }

}
