//
//  CharacterListViewModel.swift
//  ApiApp
//
//  Created by Nam Pham on 04/02/2023.
//

import UIKit

protocol CharacterListViewModelDelegate: AnyObject{
    func didLoadInitialCharacter()
}

final class CharacterListViewModel:NSObject{
    
    public weak var delegate: CharacterListViewModelDelegate?
    
    private var characters: [Character] = [] {
            didSet {
                for character in characters {
                    let viewModel = CharacterCollectioViewCellModel(
                        characterName: character.name,
                        characterStatus: character.status,
                        characterImageUrl: URL(string: character.image)
                    )
                        cellViewModels.append(viewModel)
                }
                
                
            }
        }
    
    public var cellViewModels: [CharacterCollectioViewCellModel] = []
    
  
      

    
    //FetchCharacter
    public func fetchCharacters() {
        
            Services.shared.execute(
                .listAllCharactersResquests,
                expecting: GetAllCharaterResponse.self
            ) { [weak self] result in
                switch result {
                case .success(let responseModel):
                    let results = responseModel.results
                    self?.characters = results
                    DispatchQueue.main.async {
                        self?.delegate?.didLoadInitialCharacter()
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
                
            }
        
        
        
      }
    
}

extension CharacterListViewModel: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.register( UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCell")
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CharacterCell",
            for: indexPath
            
        ) as! CharacterCollectionViewCell
        
        cell.layer.cornerRadius = 8
        
        cell.backgroundColor = .systemGray
        
        cell.configure(with: cellViewModels[indexPath.row])
       
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        
        let width = (bounds.width-30)/2
        
        return CGSize(width: width, height: width*1.5)
    }
    
}
