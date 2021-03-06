//
//  PopularImagePostTableViewCell.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit
import Kingfisher

class PopularImagePostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeIconImageView: UIImageView!
    @IBOutlet weak var popularImageImageView: UIImageView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit() {
        nameLabel.textColor = UIColor(red: 0.114, green: 0.114, blue: 0.114, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        descriptionLabel.textColor = UIColor(red: 0.246, green: 0.246, blue: 0.246, alpha: 1)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        likeNumberLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        likeNumberLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        likeIconImageView.image = R.image.postLikeIcon()
        likeIconImageView.contentMode = .scaleAspectFit
        popularImageImageView.contentMode = .scaleAspectFill
        detailView.backgroundColor = .white
        separatorView.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
    }
    
    func configureCell(with viewModel : PopularImagePostViewModel) {
        popularImageImageView.kf.setImage(with: viewModel.imageUrl)
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        likeNumberLabel.text = viewModel.formattedLikeNumber
    }

}
