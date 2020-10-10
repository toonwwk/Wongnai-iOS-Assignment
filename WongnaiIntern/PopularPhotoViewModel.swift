//
//  PopularPhotoViewModel.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

enum PopularPhotoSectionType: Int, CaseIterable {
    case PopulatPhoto, LoadMore
}

class PopularPhotoViewModel {
    
    private let popularPhotoService = PopularPhotoService()
    var popularPhoto = [Photo]()
    var currentPage = 1
    var updateHandler: (() -> ())?
    var canLoadMorePhoto = false
    
    init() {
        fetchPhoto()
    }
    
    func fetchPhoto() {
        popularPhotoService.fetchData(currentPage: currentPage) { (popularPhotoData) in
            guard let photos = popularPhotoData.photos, let totalPages = popularPhotoData.totalPages else { return }
                        
            for photo in photos {
                self.popularPhoto.append(photo)
            }
                        
            self.canLoadMorePhoto = totalPages != self.currentPage
            self.currentPage += 1
            
            self.updateHandler?()
        } isFailed: { (error) in
            print(error.localizedDescription)
        }
    }
    
    func loadMorePhotos() {
        fetchPhoto()
    }
    
    func reloadData() {
        currentPage = 1
        popularPhoto.removeAll()
        updateHandler?()
        canLoadMorePhoto = false
        fetchPhoto()
    }
    
    func numberOfSections() -> Int {
        
        return PopularPhotoSectionType.allCases.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch sectionType(at: IndexPath(row: 0, section: section)) {
        case .PopulatPhoto:
            return popularPhoto.count
        case .LoadMore:
            return canLoadMorePhoto ? 1 : 0
        }
    }
    
    func sectionType(at indexPath: IndexPath) -> PopularPhotoSectionType {
        return PopularPhotoSectionType(rawValue: indexPath.section)!
    }
    
    func dataForRow(at indexPath: IndexPath) -> Any? {
        switch sectionType(at: indexPath) {
        case .PopulatPhoto:
            let photo = popularPhoto[indexPath.row]
            return PhotoViewModel(url: URL(string: photo.imageUrl?[0] ?? "")!, name: photo.name ?? "", description: photo.description ?? "", likeNumber: formatLikeNumber(with: photo.positiveVotesCount))
        case .LoadMore:
            return nil
        }
    }
    
    func formatLikeNumber(with int: Int?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: int) ?? "0"
    }

}
