//
//  ViewController.swift
//  VocabularyGrid
//
//  Created by Kateryna on 05/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables
    var words = [
        Word(text: "banana", definition: "a yellow fruit"),
        Word(text: "apple", definition: "a red fruit"),
        Word(text: "melon", definition: "a yellow fruit"),
        Word(text: "pear", definition: "a green fruit"),
        Word(text: "tomato", definition: "a red fruit"),
        Word(text: "apple", definition: "a red fruit"),
        Word(text: "melon", definition: "a yellow fruit"),
        Word(text: "pear", definition: "a green fruit"),
        Word(text: "tomato", definition: "a red fruit"),
        Word(text: "banana", definition: "a yellow fruit"),
        Word(text: "apple", definition: "a red fruit"),
        Word(text: "melon", definition: "a yellow fruit"),
        Word(text: "pear", definition: "a green fruit"),
        Word(text: "tomato", definition: "a red fruit"),
        Word(text: "apple", definition: "a red fruit"),
        Word(text: "melon", definition: "a yellow fruit"),
        Word(text: "pear", definition: "a green fruit"),
        Word(text: "tomato", definition: "a red fruit"),
        Word(text: "banana", definition: "a yellow fruit"),
        Word(text: "apple", definition: "a red fruit"),
        Word(text: "melon", definition: "a yellow fruit"),
        Word(text: "pear", definition: "a green fruit"),
        Word(text: "tomato", definition: "a red fruit"),
        Word(text: "apple", definition: "a red fruit"),
        Word(text: "melon", definition: "a yellow fruit"),
        Word(text: "pear", definition: "a green fruit"),
        Word(text: "tomato", definition: "a red fruit")

    ]
    
    //MARK: - UI Components
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CustomViewCell.self, forCellWithReuseIdentifier: CustomViewCell.identifier)
        return collectionView
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    func setupUI() {
        self.view.backgroundColor = .red
        self.view.addSubview(self.collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomViewCell.identifier, for: indexPath) as? CustomViewCell else {
            fatalError("Failed to dequeue the cell in ViewController")
        }
        let word = words[indexPath.item].text
        cell.configure(with: word)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let word = words[indexPath.item]
        let alert = UIAlertController(title: word.text, message: word.definition, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth: CGFloat = (self.view.frame.width - 20) / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
