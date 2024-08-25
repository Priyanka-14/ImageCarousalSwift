//
//  ListViewModel.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import Foundation
import UIKit

class ListViewModel {
    var items: [String] = []
    var filteredItems: [String] = []
    
    func loadItems() {
        items = DataModel.shared.loadItems()
        filteredItems = items
    }
    
    func filterItems(searchText: String) {
        if searchText.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func calculateStatistics() -> (itemCount: Int, topCharacters: [(character: String, count: Int)]) {
        let itemCount = filteredItems.count
        
        var charCounts: [Character: Int] = [:]
        filteredItems.joined().forEach { charCounts[$0, default: 0] += 1 }
        
        let topCharacters = charCounts
            .sorted(by: { $0.value > $1.value })
            .prefix(3)
            .map { (String($0.key), $0.value) }
        
        return (itemCount, topCharacters)
    }
}
