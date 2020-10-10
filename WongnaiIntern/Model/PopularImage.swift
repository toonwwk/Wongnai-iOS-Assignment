//
//  PopularImage.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

struct PopularImage: Decodable {
    let imageUrl: [String]?
    let name: String?
    let description: String?
    let positiveVotesCount : Int?
}
