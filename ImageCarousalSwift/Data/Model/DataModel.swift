//
//  DataModel.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import UIKit

class DataModel {
    static let shared = DataModel()
    
    private init() { }

    func loadImages() -> [UIImage] {
        return [
            UIImage(named: "Image1")!,
            UIImage(named: "Image2")!,
            UIImage(named: "Image3")!,
            UIImage(named: "Image4")!,
            UIImage(named: "Image5")!,
            UIImage(named: "Image6")!
        ]
    }
    
    func loadItems() -> [String] {
        return ["India", "Malaysia", "Swizerland", "Indonesia", "England", "Singapur"]
    }
}
