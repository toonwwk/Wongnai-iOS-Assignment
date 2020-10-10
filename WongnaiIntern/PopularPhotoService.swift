//
//  PopularPhotoService.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation
import Alamofire

struct PopularPhotoService {

    func fetchData(currentPage: Int, isCompleted: @escaping (PopularPhotoResponse) -> (), isFailed: @escaping (Error) -> ()) {
        
        let url = "https://api.500px.com/v1/photos?feature=popular&page=" + String(currentPage)
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let data = try decoder.decode(PopularPhotoResponse.self, from: response.data!)
                    isCompleted(data)
                } catch {
                    isFailed(error)
                }
                
            }
        }
    }
    
}
