
import Foundation
import Alamofire

protocol HomePresenterDelegate: AnyObject {
    func homePresenter(_ presenter: HomePresenter, with data: [CategoryData])
    func bannerPresenter(_ presenter: HomePresenter, with bannerData: [BannerData])
}

class HomePresenter {
    
    weak var delegate: HomePresenterDelegate?
 
    func fetchData() {
        let baseURL = "http://51.195.118.214:8888/category/"
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
    func fetchBanners() {
        let baseURl = "http://51.195.118.214:8888/slide"
        guard let url = URL(string: baseURl) else {return}
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = ["api-token": "", "Accept-Language": "sr"]
        AF.request(request).response { [weak self] response in
            guard let self = self,
                  let data = response.data
            else {return}
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode(BannerModel.self, from: data)
                self.delegate?.bannerPresenter(self, with: userData.data)
            } catch let error {
                debugPrint(error)
            }
        }
    }
}


