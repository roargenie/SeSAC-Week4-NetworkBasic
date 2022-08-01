

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class BeerViewController: UIViewController {
    
    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var changeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestRandomBeer()
        designUI()
        
    }
    
    func requestRandomBeer() {
        
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):

                let json = JSON(value)

                let imageURL = json[0]["image_url"].stringValue
                guard let image = URL(string: imageURL) else { return }
                self.beerImage.kf.setImage(with: image)

                let description = json[0]["description"].stringValue
                self.descriptionLabel.text = description

                let name = json[0]["name"].stringValue
                self.nameLabel.text = name

            case .failure(let error):
                print(error)

            }
        }
    }
    
    func designUI() {
        beerImage.contentMode = .scaleAspectFit
        changeButton.setTitle("추천받기", for: .normal)
        nameLabel.textAlignment = .center
        nameLabel.font = .boldSystemFont(ofSize: 15)
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
    }
    
    @IBAction func changeButtonTapped(_ sender: UIButton) {
        requestRandomBeer()
        
        
    }
    
    
    
}
