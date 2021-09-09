//
//  ViewController.swift
//  CollectionViewHorizontalPractice
//
//  Created by 坂本龍哉 on 2021/09/08.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.collectionViewLayout = createLayout()

        collectionView.register(CollectionViewCell.nib,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
    }

}

extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(#function)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0),
                                               heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.configure()
        cell.layer.cornerRadius = cell.frame.height / 2
        return cell
    }
    
}
