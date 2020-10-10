//
//  InsertionPhotoTableViewCell.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit

class InsertionPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var insetionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell() {
        insetionImageView.image = R.image.imageInsertion()
    }
    
}
