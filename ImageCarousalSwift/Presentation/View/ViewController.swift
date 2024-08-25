//
//  ViewController.swift
//  ImageCarousalSwift
//
//  Created by Priyanka Mahadik on 23/08/24.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let imageCarouselViewModel = ImageCarouselViewModel()
    let listViewModel = ListViewModel()
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        loadData()
    }

    func setupViews() {
        // Setup Search Bar
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        
        // Setup Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Setup Page Control
        pageControl.numberOfPages = imageCarouselViewModel.images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .blue
        
        // Setup Table View
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        
        // Setup Floating Action Button
        floatingButton.layer.cornerRadius = 25
        floatingButton.layer.masksToBounds = true
        floatingButton.backgroundColor = .blue
        floatingButton.setTitle("⋮", for: .normal)
        floatingButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        floatingButton.setTitleColor(.white, for: .normal)
    }

    
    func loadData() {
        imageCarouselViewModel.loadImages()
        listViewModel.loadItems()
        tableView.reloadData()
        pageControl.numberOfPages = imageCarouselViewModel.images.count
    }
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listViewModel.filterItems(searchText: searchText)
        tableView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCarouselViewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCarouselCell", for: indexPath) as! ImageCarouselCollectionViewCell
        cell.configure(with: imageCarouselViewModel.images[indexPath.item])
        return cell
    }
    // UICollectionViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
            pageControl.currentPage = page
            currentImageIndex = page
            tableView.reloadData() // Reload table view data to reflect the current image index
        }
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        let item = listViewModel.filteredItems[indexPath.row]
        cell.configure(with: imageCarouselViewModel.images[currentImageIndex], title: item, subtitle: "Subtitle for \(item)")
        return cell
    }

    @IBAction func floatingButtonTapped(_ sender: UIButton) {
        let statistics = listViewModel.calculateStatistics()
        showBottomSheet(statistics: statistics)
    }
    
    func showBottomSheet(statistics: (itemCount: Int, topCharacters: [(character: String, count: Int)])) {
        let bottomSheetVC = BottomSheetViewController(statistics: statistics)
        present(bottomSheetVC, animated: true, completion: nil)
    }
}

