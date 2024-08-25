//
//  BottomSheetViewController.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import Foundation
import UIKit

class BottomSheetViewController: UIViewController {
    
    let statistics: (itemCount: Int, topCharacters: [(character: String, count: Int)])
    
    init(statistics: (itemCount: Int, topCharacters: [(character: String, count: Int)])) {
        self.statistics = statistics
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        label.text = """
        List \(statistics.itemCount) items
        Top Characters:
        \(statistics.topCharacters.map { "\($0.character): \($0.count)" }.joined(separator: "\n"))
        """
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
        ])
    }
}
