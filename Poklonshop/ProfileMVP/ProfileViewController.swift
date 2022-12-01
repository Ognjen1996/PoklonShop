//
//  ProfileViewController.swift
//  Poklonshop
//
//  Created by Ognjen on 21.11.22..
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        // Do any additional setup after loading the view.
    }

}
extension ProfileViewController: UITableViewDelegate {
    
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellT: ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cellT.titleLabel.text = "Ovo je red br " + String(indexPath.row)
        cellT.n = indexPath.row
        return cellT
    }
}
