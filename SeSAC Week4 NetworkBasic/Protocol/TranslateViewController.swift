

import UIKit




// UIButton, UITextField > Action
// UITextView, UISearchBar, UIPickerView > Action(X)
// UIControl을 상속받고 안받고 차이

class TranslateViewController: UIViewController {
    
    @IBOutlet weak var userInputTextView: UITextView!
    
    let textViewPlaceholderText = "번역하고 싶은 문장을 작성해보세요."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInputTextView.delegate = self
        
        userInputTextView.text = textViewPlaceholderText
        userInputTextView.textColor = .lightGray
        
    }
    
    
    
}


extension TranslateViewController: UITextViewDelegate {
    
    // 텍스트뷰의 텍스트가 변할때마다 호출
    func textViewDidChange(_ textView: UITextView) {
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
