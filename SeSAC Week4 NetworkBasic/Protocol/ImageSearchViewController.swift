//
//  ImageSearchViewController.swift
//  SeSAC Week4 NetworkBasic
//
//  Created by 이명진 on 2022/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class ImageSearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var imageArr: [SearchModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        requestImage(searchText: "과자")
        
        collectionView.register(UINib(nibName: ImageSearchCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageSearchCollectionViewCell.identifier)
        
        setCollectionViewLayout()
        
    }
    
    func requestImage(searchText: String) {
        
        // 페이지 네이션 -> 스크롤로 데이터를 계속 받아오게 하는것 : offset / cusor
        // 소켓(양방향 통신) vs HTTP(단방향 통신 / 비연결성, 무상태성)
        
        let text = "\(searchText)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = EndPoint.imageSearchURL + "query=\(text)&display=20&start=1&sort=sim"
        let header: HTTPHeaders = ["X-Naver-Client-Id": APIKey.NAVER_ID, "X-Naver-Client-Secret": APIKey.NAVER_SECRET]
        
        AF.request(url, method: .get, headers: header).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print("JSON: \(json)")
                self.imageArr.removeAll()
                
                for i in 0...19 {
                    let imageURL = json["items"][i]["thumbnail"].stringValue
                    guard let image = URL(string: imageURL) else { return }
                    
                    let data = SearchModel(image: image)
                    
                    self.imageArr.append(data)
                }
                
                print(self.imageArr)
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func setCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        
        layout.itemSize = CGSize(width: width, height: width * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
}

extension ImageSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageSearchCollectionViewCell.identifier, for: indexPath) as? ImageSearchCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imageView.kf.setImage(with: imageArr[indexPath.row].image)
        
        return cell
    }
  
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestImage(searchText: searchBar.text!)
    }
    
    
}


