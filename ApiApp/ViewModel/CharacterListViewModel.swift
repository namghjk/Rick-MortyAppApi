//
//  CharacterListViewModel.swift
//  ApiApp
//
//  Created by Nam Pham on 04/02/2023.
//

import UIKit


final class CharacterListViewModel:NSObject {
    func fetchCharacter(){
        
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

extension CharacterListViewModel: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}
