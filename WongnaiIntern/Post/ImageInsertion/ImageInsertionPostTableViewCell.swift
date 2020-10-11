//
//  ImageInsertionPostTableViewCell.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit

class ImageInsertionPostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageInsertionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        imageInsertionImageView.image = R.image.postImageInsertion()
    }
    
}
