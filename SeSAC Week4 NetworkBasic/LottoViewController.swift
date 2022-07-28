//
//  LottoViewController.swift
//  SeSAC Week4 NetworkBasic
//
//  Created by 이명진 on 2022/07/28.
//

import UIKit

class LottoViewController: UIViewController {
    
    let numberList: [Int] = Array(1...1025).reversed()
    
    
    @IBOutlet weak var numberTextField: UITextField!
    
    //@IBOutlet weak var lottoPickerView: UIPickerView!
    
    var lottoPickerView = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
        numberTextField.inputView = lottoPickerView
        numberTextField.inputView?.backgroundColor = .orange
        
        
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
        numberTextField.text = "\(numberList[row])회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}



