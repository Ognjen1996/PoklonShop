//
//  CartViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    var presenter: PersonalizeViewController?
    var selectedLogo: String?
    var cartItems: [String]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        guard let cartItems = cartItems else {return cell}
            tableView.isHidden = false
            cell.productLabel.text = "Pivska čaša sa " + cartItems[indexPath.row]
            cell.logoImage.image = UIImage(named: cartItems[indexPath.row])
            cell.priceLabel.text = "1600 RSD"

        return cell
    }
}
extension CartViewController: UITableViewDelegate {
    
}
extension CartViewController: PersonalizeViewControllerDelegate {
    func personalizeData(_ presenter: PersonalizeViewController, data: [String]) {
        self.cartItems = data
    }
}
