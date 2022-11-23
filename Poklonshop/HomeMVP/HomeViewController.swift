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
    var presenter: HomePresenter?
    var categoryData: [CategoryData]? = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        presenter?.fetchData()
        tableView.delegate = self
        tableView.dataSource = self
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
    
    
}

