//
//  ImageCarouselViewModel.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import Foundation
import UIKit

class ImageCarouselViewModel {
    var images: [UIImage] = []
    
    func loadImages() {
        images = DataModel.shared.loadImages()
    }
}
