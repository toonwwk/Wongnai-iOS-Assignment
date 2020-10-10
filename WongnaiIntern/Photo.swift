//
//  Photo.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

struct PopularPhotoData: Decodable {
    var imageUrl: [String]?
    var name: String?
    var description: String?
    var positiveVotesCount : Int?
}
