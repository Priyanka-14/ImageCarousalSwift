//
//  ListTableViewCell.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import Foundation
import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(with image: UIImage, title: String, subtitle: String) {
        itemImageView.layer.cornerRadius = 10
        itemImageView.layer.masksToBounds = true
        itemImageView.image = image
        itemImageView.contentMode = .scaleAspectFill
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        self.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.1)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
