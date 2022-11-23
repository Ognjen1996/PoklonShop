
import Foundation
import Alamofire

protocol HomePresenterDelegate: AnyObject {
    func homePresenter(_ presenter: HomePresenter, with data: [CategoryData])
}

class HomePresenter {
    
    weak var delegate: HomePresenterDelegate?
 
    func fetchData() {
        let baseURL = "http://51.195.118.214:8888/category?limit=100000&offset=0&orderBy=id&orderDirection=asc"
        guard let url = URL(string: baseURL) else {return}
        var request = URLRequest(url: url)
        
        request.method = .get
        request.headers = ["api-token": "", "Accept-Language": "sr"]
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else {return}
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode(CategoryModel.self, from: data)
                self.delegate?.homePresenter(self, with: userData.data)
            } catch let error {
                debugPrint(error)
            }
        }
        
    }
}


