//
//  TileCollectionViewCell.swift
//  SurfPetProject
//
//  Created by Илья Морин on 14.02.2023.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let bacgroundColor: UIColor
    
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
        
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .light)
        return label
        
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        contentView.backgroundColor = viewModel.bacgroundColor
        label.text = viewModel.name
    }
    
}
