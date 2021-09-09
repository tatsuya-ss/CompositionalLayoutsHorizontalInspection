//
//  CollectionViewCell.swift
//  CollectionViewHorizontalPractice
//
//  Created by 坂本龍哉 on 2021/09/08.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    
    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure() {
        iconImageView.image = UIImage(named: "icon")
    }
}
