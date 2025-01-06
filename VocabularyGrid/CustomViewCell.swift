//
//  CustomViewCell.swift
//  VocabularyGrid
//
//  Created by Kateryna on 05/01/2025.
//

import UIKit

class CustomViewCell: UICollectionViewCell {
    
    static let identifier = "CustomViewCell"
    private var textLabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    
    public func configure(with text: String) {
        textLabel.text = text
        self.setupUI()
    }
    
   private func setupUI() {
       self.contentView.addSubview(textLabel)
       self.contentView.backgroundColor = .systemBlue
       self.contentView.layer.cornerRadius = 7
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
}
