//
//  BoardViewModel.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 10/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import Foundation

enum BoardContentSectionType: Int, CaseIterable {
    case ImagePost, LoadMore
}

enum ServiceStatusType {
    case loading, success, failed
}

class BoardViewModel {
    
    let popularImageService = PopularImageService()
    var popularImage = [PopularImage]()
    var statusType: ServiceStatusType = .loading
    var currentPage = 1
    var canLoadMorePhoto = false
    var updateHandler: (() -> ())?
    
    var numberOfInsertionPhoto: Int {
        return Int(popularImage.count / 4)
    }

    init() {
        fetchImage()
    }
    
    func fetchImage() {
        popularImageService.fetchData(currentPage: currentPage) { (response) in
            guard let image = response.photos else { return }
            self.popularImage += image
            self.canLoadMorePhoto = (response.totalPages ?? 0) != self.currentPage
            self.currentPage += 1
            self.statusType = .success
            self.updateHandler?()
        } isFailed: { (error) in
            print(error.localizedDescription)
            self.statusType = .failed
        }
    }
    
    func loadMoreImage() {
        fetchImage()
    }
    
    func reloadData() {
        popularImage.removeAll()
        currentPage = 1
        statusType = .loading
        canLoadMorePhoto = false
        updateHandler?()
        fetchImage()
    }
    
    func numberOfSections() -> Int {
        return BoardContentSectionType.allCases.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch sectionType(at: IndexPath(row: 0, section: section)) {
        case .ImagePost:
            return statusType == .success ? (popularImage.count + numberOfInsertionPhoto) : 0
        case .LoadMore:
            return statusType == .success ? (canLoadMorePhoto ? 1 : 0) : 0
        }
    }
    
    func sectionType(at indexPath: IndexPath) -> BoardContentSectionType {
        return BoardContentSectionType(rawValue: indexPath.section)!
    }
    
    func dataForRow(at indexPath: IndexPath) -> Any? {
        switch sectionType(at: indexPath) {
        case .ImagePost:
            if (isImageInsertionPost(at: indexPath)) { return nil }
            
            let photo = popularImage[indexWithoutImageInsertion(at: indexPath)]
            let name = photo.name ?? ""
            let description = photo.description ?? ""
            let likeNumber = photo.positiveVotesCount ?? 0
            let urlString = photo.imageUrl?.first ?? ""
            return PopularImagePostViewModel(name: name, description: description, likeNumber: likeNumber, imageUrlString: urlString)
        case .LoadMore:
            return nil
        }
    }
    
    func isImageInsertionPost(at indexPath: IndexPath) -> Bool {
        return (indexPath.row + 1) % 5 == 0
    }
    
    func indexWithoutImageInsertion(at indexPath: IndexPath) -> Int {
        return indexPath.row - (Int(indexPath.row / 5))
    }
    
}
