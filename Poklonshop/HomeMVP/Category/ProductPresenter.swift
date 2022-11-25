//
//  ProductPresenter.swift
//  Poklonshop
//
//  Created by Ognjen on 25.11.22..
//
import Alamofire
import Foundation

protocol ProductPresenterDelegate: AnyObject {
    func productPresenter(_ presenter: ProductPresenter, with data: SubCategoryData)
}

class ProductPresenter {
    
    var delegate: ProductPresenterDelegate?
    
    func fetchProducts(for idd: String) { 
        let baseURL = "http://51.195.118.214:8888/category/\(idd)"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = ["Accept-Language": "sr", "api-token": ""]
        
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else {return}
            let decoder = JSONDecoder()
            do {
               let userData = try decoder.decode(SubCategoryModel.self, from: data)
                self.delegate?.productPresenter(self, with: userData.data)
            } catch let error {
                debugPrint(error)
            }
            
        }
    }
}
