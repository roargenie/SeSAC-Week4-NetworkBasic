//
//  ListTableViewCell.swift
//  SeSAC Week4 NetworkBasic
//
//  Created by 이명진 on 2022/07/27.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
