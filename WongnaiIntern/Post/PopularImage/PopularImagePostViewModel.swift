//
//  PopularImagePostViewModel.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

class PopularImagePostViewModel {
    
    let name: String
    let description: String
    let likeNumber: Int
    let imageUrlString: String
    
    var imageUrl: URL? {
        return URL(string: imageUrlString)
    }
    
    var formattedLikeNumber: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: likeNumber) ?? "0"
    }
    
    init(name: String, description: String, likeNumber: Int, imageUrlString: String) {
        self.name = name
        self.description = description
        self.likeNumber = likeNumber
        self.imageUrlString = imageUrlString
    }
    
}
