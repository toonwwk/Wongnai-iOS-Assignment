//
//  PopularPhotoViewController.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit

class PopularPhotoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = PopularPhotoViewModel()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        bindViewModel()
    }
    
    func configure() {
        tableView.register(R.nib.tableViewCell)
        tableView.register(R.nib.loadMoreTableViewCell)
        tableView.register(R.nib.popularPhotoTableViewCell)
        refreshControl.addTarget(self, action: #selector(refreshControlValueDidChange), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func bindViewModel() {
        viewModel.updateHandler = { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            UIView.transition(with: self.tableView, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.tableView.reloadData()
            })
        }
    }
    
    @objc func refreshControlValueDidChange() {
        viewModel.reloadData()
    }

}

// MARK: - tableview
extension PopularPhotoViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.sectionType(at: indexPath) {
        case .PopulatPhoto:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.popularPhotoTableViewCell, for: indexPath)
            cell?.configureCell(with: viewModel.dataForRow(at: indexPath) as! PhotoViewModel)
            return cell!
        case .LoadMore:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loadMoreTableViewCell, for: indexPath)!
            cell.configureCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch viewModel.sectionType(at: indexPath) {
        case .LoadMore:
            viewModel.loadMorePhotos()
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


