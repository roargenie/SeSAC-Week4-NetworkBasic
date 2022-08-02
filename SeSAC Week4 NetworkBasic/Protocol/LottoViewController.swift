

import UIKit

import Alamofire
import SwiftyJSON


class LottoViewController: UIViewController {
    
    
    @IBOutlet var numberLabel: [UILabel]!
    
    let numberList: [Int] = Array(1...1025).reversed()
    
    var backgroundColor: [UIColor] = [.green, .red, .blue, .yellow, .lightGray]
    
    @IBOutlet weak var numberTextField: UITextField!
    
    //@IBOutlet weak var lottoPickerView: UIPickerView!
    
    var lottoPickerView = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
        numberTextField.inputView = lottoPickerView
        numberTextField.inputView?.backgroundColor = .orange
        setLabel()
        requestLotto(number: 1025)
    }
    
    func requestLotto(number: Int) {
        
        let url = "\(EndPoint.lottoURL)&drwNo=\(number)"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for i in 1...6 {
                    let drawtNo = json["drwtNo\(i)"].intValue
                    self.numberLabel[i - 1].text = "\(drawtNo)"
                }
                
                let bonus = json["bnusNo"].intValue
                self.numberLabel[6].text = "\(bonus)"
                
                let drawDate = json["drwNoDate"].stringValue
                print(drawDate)
                
                self.numberTextField.text = drawDate
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setLabel() {
        for i in numberLabel {
            i.textAlignment = .center
            i.font = .boldSystemFont(ofSize: 20)
            i.layer.cornerRadius = 25
            i.clipsToBounds = true
            i.backgroundColor = backgroundColor.randomElement()
        }
    }
    
    
    
    
    
    
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        requestLotto(number: numberList[row])
        setLabel()
//        numberTextField.text = "\(numberList[row])회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}



