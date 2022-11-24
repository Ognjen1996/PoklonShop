//
//  ViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//
import Kingfisher
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var collectionView: UICollectionView!
    var presenter: HomePresenter?
    var categoryData: [CategoryData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var bannerData: [BannerData]? = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        presenter?.fetchData()
        presenter?.fetchBanners()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 320, height: 120)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        tableView.rowHeight = 300
        
        
        // Do any additional setup after loading the view.
    }


}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        guard let category = categoryData else {return}
        vc.selectedCategory = category[indexPath.row]
        show(vc, sender: self)
    }
    
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryData?.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        guard let categories = categoryData else {return cell}
        cell.label.text = categories[indexPath.row].name
        guard let url = URL(string: categories[indexPath.row].image ?? "") else {return cell}
        cell.menuImage.kf.setImage(with: url)
        return cell
    }

}
extension HomeViewController: HomePresenterDelegate {
    func homePresenter(_ presenter: HomePresenter, with data: [CategoryData]) {
        self.categoryData = data
    }
    func bannerPresenter(_ presenter: HomePresenter, with bannerData: [BannerData]) {
        self.bannerData = bannerData
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannerData?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        guard let banner = bannerData else {return cell}
        cell.setupImage(with: banner[indexPath.row])
        return cell
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.size.width, height: collectionViewFrame.height)
    }
}
