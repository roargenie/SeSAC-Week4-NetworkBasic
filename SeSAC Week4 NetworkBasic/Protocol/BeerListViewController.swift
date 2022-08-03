

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class BeerListViewController: UIViewController {
    
    @IBOutlet weak var beerTabelView: UITableView!
    
    var beerList: [BeerModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beerTabelView.delegate = self
        beerTabelView.dataSource = self
        
        beerTabelView.register(UINib(nibName: BeerTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: BeerTableViewCell.reuseIdentifier)
        
        requestBeerList()
        
        self.beerTabelView.rowHeight = 200
        
    }
    
    func requestBeerList() {
        
        let url = EndPoint.beerURL
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                for i in 0...10 {
                    let name = json[i]["name"].stringValue
                    let description = json[i]["description"].stringValue
                    let imageURL = json[i]["image_url"].stringValue
                    guard let image = URL(string: imageURL) else { return }
                    
                    let data = BeerModel(beerName: name, beerImage: image, beerDescription: description)
                    
                    self.beerList.append(data)
                }
                self.beerTabelView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
     
}

extension BeerListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reuseIdentifier, for: indexPath) as? BeerTableViewCell else { return UITableViewCell() }
        
        let data = beerList[indexPath.row]
        
        cell.beerImage.kf.setImage(with: data.beerImage)
        cell.descriptionLabel.text = data.beerDescription
        cell.nameLabel.text = data.beerName
        
        return cell
    }
    
}
