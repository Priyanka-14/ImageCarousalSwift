//
//  ImageCarouselCollectionViewCell.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import Foundation
import UIKit

class ImageCarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with image: UIImage) {
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }
}
