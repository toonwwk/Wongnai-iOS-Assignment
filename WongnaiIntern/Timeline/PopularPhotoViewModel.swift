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

enum PopularPhotoServiceStatusType {
    case loading, success, failed
}

class PopularPhotoViewModel {
    
    private let popularPhotoService = PopularPhotoService()
    var popularPhoto = [Photo]()
    var currentPage = 1
    var updateHandler: (() -> ())?
    var canLoadMorePhoto = false
    var statusType: PopularPhotoServiceStatusType = .loading
    
    init() {
        fetchPhoto()
    }
    
    func fetchPhoto() {
        popularPhotoService.fetchData(currentPage: currentPage) { (popularPhotoData) in
            guard let photos = popularPhotoData.photos, let totalPages = popularPhotoData.totalPages else { return }
            self.popularPhoto += photos
            self.canLoadMorePhoto = totalPages != self.currentPage
            self.currentPage += 1
            self.statusType = .success
            self.updateHandler?()
        } isFailed: { (error) in
            print(error.localizedDescription)
            self.statusType = .failed
        }
    }
    
    func loadMorePhotos() {
        fetchPhoto()
    }
    
    func reloadData() {
        currentPage = 1
        popularPhoto.removeAll()
        statusType = .loading
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
            return statusType == .success ? (popularPhoto.count + numberOfInsertionPhoto()) : 0
        case .LoadMore:
            return statusType == .success ? (canLoadMorePhoto ? 1 : 0) : 0
        }
    }
    
    func sectionType(at indexPath: IndexPath) -> PopularPhotoSectionType {
        return PopularPhotoSectionType(rawValue: indexPath.section)!
    }
    
    func dataForRow(at indexPath: IndexPath) -> Any? {
        switch sectionType(at: indexPath) {
        case .PopulatPhoto:
            if (isInsertionPhotoTableViewCell(indexPath)) {
                return nil
            }
            
            let photo = popularPhoto[indexWithoutInsertionPhoto(at: indexPath)]
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
    
    func isInsertionPhotoTableViewCell(_ indexPath: IndexPath) -> Bool {
        return (indexPath.row + 1) % 5 == 0
    }

    func numberOfInsertionPhoto() -> Int{
        return Int((floor(Double(popularPhoto.count / 4))))
    }
    
    func indexWithoutInsertionPhoto(at indexPath: IndexPath) -> Int{
        return indexPath.row - (Int((floor(Double(indexPath.row / 5)))))
    }
}
