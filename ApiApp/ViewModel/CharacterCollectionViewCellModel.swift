//
//  CharacterCollectionViewCellModel.swift
//  ApiApp
//
//  Created by Nam Pham on 13/02/2023.
//

import Foundation


final class CharacterCollectioViewCellModel {
    
    public var characterName:String
    private var characterStatus:CharacterStatus
    private var characterImageUrl:URL?
    
    
    
    
    //MARK: -init
    init(
        characterName:String,
        characterStatus:CharacterStatus,
        characterImageUrl:URL?
        
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
        
    }
    
    public var characterStatusText: String {
        return "Status:\(characterStatus.rawValue)"
    }
    
    public func fecthImage(completion: @escaping (Result<Data,Error>)-> Void){
        
        //TODO: Abstract to Image Manager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url:url )
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
