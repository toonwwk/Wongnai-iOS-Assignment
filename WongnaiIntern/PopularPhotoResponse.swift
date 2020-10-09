//
//  PopularPhotoModel.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

struct PopularPhotoResponse: Decodable {
    var totalPages: Int?
    var photos: [Photo]?
}
