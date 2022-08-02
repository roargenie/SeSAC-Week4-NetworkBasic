

import UIKit

import Alamofire
import SwiftyJSON


// UIButton, UITextField > Action
// UITextView, UISearchBar, UIPickerView > Action(X)
// UIControl을 상속받고 안받고 차이

class TranslateViewController: UIViewController {
    
    @IBOutlet weak var userInputTextView: UITextView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    let textViewPlaceholderText = "번역하고 싶은 문장을 작성해보세요."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceholderText
        userInputTextView.textColor = .lightGray
        
        userInputTextView.font = UIFont(name: "BinggraeMelona", size: 20)
        requestTranslatedData(text: "")
    }
    
    func requestTranslatedData(text: String) {
        
        let url = EndPoint.papagoURL
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        let parameter = ["source": "ko", "target": "en", "text": "\(text)"]
        
        AF.request(url, method: .post, parameters: parameter, headers: header).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                let translated = json["message"]["result"]["translatedText"].stringValue
                print(translated)
                self.textLabel.text = translated
//
//                let statusCode = response.response?.statusCode ?? 500
//
//                if statusCode == 200 {
//
//                } else {
//                    self.textLabel.text = json["errorMessage"].stringValue
//                }
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    @IBAction func translateButtonTapped(_ sender: UIButton) {
        requestTranslatedData(text: userInputTextView.text)
        
    }
    
    
    
}


extension TranslateViewController: UITextViewDelegate {
    
    // 텍스트뷰의 텍스트가 변할때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        //requestTranslatedData(text: userInputTextView.text)
        
        print(textView.text.count)
    }
    
    // 편집이 시작될 때. 커서가 생기는 순간
    // 텍스트뷰의 글자가 플레이스 홀더랑 글자가 같으면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Begin")
        
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 편집이 끝났을 때. 커서가 없어지는 순간
    // 텍스트뷰의 글자가 없으면 플레이스 홀더 글자로 보이게
    func textViewDidEndEditing(_ textView: UITextView) {
        print("End")
        
        if textView.text.isEmpty {
            textView.text = textViewPlaceholderText
            textView.textColor = .lightGray
        }
    }
    
    
    
}
