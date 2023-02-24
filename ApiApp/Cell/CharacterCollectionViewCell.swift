//
//  CharacterCollectionViewCell.swift
//  ApiApp
//
//  Created by Nam Pham on 13/02/2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(ImageView)
        self.addSubview(statusLabel)
        self.addSubview(nameLabel)
        ImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ImageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
   
    public func configure(with viewModel: CharacterCollectioViewCellModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fecthImage { [weak self ] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.ImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
}
    
    


