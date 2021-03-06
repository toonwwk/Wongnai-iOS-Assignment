//
//  LoadMoreTableViewCell.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit

class LoadMoreTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        contentView.backgroundColor = .white
        activityIndicatorView.color = .black
    }
    
    func configureCell() {
        activityIndicatorView.startAnimating()
    }
    
}
