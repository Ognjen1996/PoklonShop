
import UIKit
import Kingfisher

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!

    var selectedLogo: String?
    var cartItems: [ProductInfo]! = [] {
        didSet{
            if let tableView = tableView {
                tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        calculatePrice()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(notificationRecieved(_:)), name: Notification.Name("newItem"), object: nil)
    }
    
    @objc func notificationRecieved(_ notif: Notification) {
        guard let logo = notif.userInfo?["logo"] as? String,
              let image = notif.userInfo?["image"] as? String,
              let price = notif.userInfo?["price"] as? String,
              let name = notif.userInfo?["name"] as? String
        else {return}
        
        let product = ProductInfo(image: image, logo: logo, price: Int(price)!, name: name)
        cartItems?.append(product)
    }
    
}
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
            tableView.isHidden = false
        cell.productLabel.text = cartItems[indexPath.row].name
        cell.logoImage.image = UIImage(named: cartItems[indexPath.row].logo)
        cell.priceLabel.text = String(cartItems[indexPath.row].price) + " RSD"
        guard let url = URL(string: cartItems[indexPath.row].image) else { return cell}
        cell.productImage.kf.setImage(with: url)
        
        cell.removeButton.tag = indexPath.row
        cell.removeButton.addTarget(self, action: #selector(removeProduct(_:)), for: .touchUpInside)
        
        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
private extension CartViewController {
    func calculatePrice() {
            var total: Int = 0
            for product in cartItems {
                total = product.price + total
            }
            totalPrice.text =  "Ukupno: " + String(total) + " RSD"
        }
    @objc func removeProduct(_ sender: UIButton) {
        cartItems.remove(at: sender.tag)
        calculatePrice()
    }
}
