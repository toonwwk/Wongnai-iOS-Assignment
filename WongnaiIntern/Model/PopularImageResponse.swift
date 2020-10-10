//
//  PopularImageResponse.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

struct PopularImageResponse: Decodable {
    let totalPages: Int?
    let photos: [PopularImage]?
}
