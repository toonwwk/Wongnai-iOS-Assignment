//
//  TableViewCell.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizesSubviews = false
    }
    
    func configureCell(with viewModel: Any?) {
        switch viewModel {
        case is PhotoViewModel:
            let contentView = PopularPhotoView.instanceFromNib()
            contentView.commonInit()
            contentView.configureCell(with: viewModel as! PhotoViewModel)
            contentView.layoutIfNeeded()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contentView)
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0).isActive = true
            view.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0).isActive = true
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0).isActive = true
            view.layoutIfNeeded()
        default:
            return
        }

    }

}
