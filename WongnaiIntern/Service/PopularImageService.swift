//
//  PopularImageService.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation
import Alamofire

struct PopularImageService {

    let baseUrl = "https://api.500px.com/v1/photos?feature=popular&page="
    
    func fetchData(currentPage: Int, isCompleted: @escaping (PopularImageResponse) -> (), isFailed: @escaping (Error) -> ()) {
        let url = baseUrl + String(currentPage)
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let data = try decoder.decode(PopularImageResponse.self, from: response.data!)
                    isCompleted(data)
                } catch {
                    isFailed(error)
                }
            }
        }
    }
    
}
