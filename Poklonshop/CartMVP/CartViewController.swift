//
//  CartViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit

class CartViewController: UIViewController {
    
    var presenter: PersonalizeViewController?
    var selectedLogo: String?
    
    @IBOutlet weak var tableView: UITableView!


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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        if let selectedLogo = selectedLogo {
            cell.productLabel.text = "Pivska čaša sa " + selectedLogo
            cell.logoImage.image = UIImage(named: selectedLogo)
            cell.priceLabel.text = "1600 RSD"
        }
        return cell
    }
}
extension CartViewController: UITableViewDelegate {
    
}


extension CartViewController: PersonalizeViewControllerDelegate {
    func personalizeData(_ presenter: PersonalizeViewController, data: String) {
        self.selectedLogo = data
    }
}
