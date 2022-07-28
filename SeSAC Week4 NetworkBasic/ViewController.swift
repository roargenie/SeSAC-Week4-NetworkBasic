//
//  ViewController.swift
//  SeSAC Week4 NetworkBasic
//
//  Created by 이명진 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController, ViewPresentableProtocol {
    
    static let identifier: String = "ViewController"
    
    var navigationTitleString: String {
        get {
            return "대장님의 다마고치"
        }
        set {
            title = newValue
        }
    }
    
    var backgroundColor: UIColor = .blue
    
    func configureView() {
        
        navigationTitleString = "고래밥님의 다마고치"
        
        title = navigationTitleString
        view.backgroundColor = backgroundColor
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    
    
    
    
    
}

