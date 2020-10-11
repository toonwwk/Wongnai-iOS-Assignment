//
//  BoardViewController.swift
//  WongnaiIntern
//
//  Created by Kanokporn Wongwaitayakul on 9/10/2563 BE.
//  Copyright © 2563 Kanokporn Wongwaitayakul. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet weak var contentTableView: UITableView!
    
    let viewModel = BoardViewModel()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        bindViewModel()
    }
    
    func configureViewController() {
        contentTableView.register(R.nib.popularImagePostTableViewCell)
        contentTableView.register(R.nib.imageInsertionPostTableViewCell)
        contentTableView.register(R.nib.loadMoreTableViewCell)
        refreshControl.addTarget(self, action: #selector(refreshControlValueDidChange), for: .valueChanged)
        contentTableView.refreshControl = refreshControl
    }
    
    func bindViewModel() {
        viewModel.updateHandler = { [weak self] in
            guard let self = self else { return }
            self.refreshControl.endRefreshing()
            UIView.transition(with: self.contentTableView, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.contentTableView.reloadData()
            })
        }
    }
    
    @objc func refreshControlValueDidChange() {
        viewModel.reloadData()
    }

}

// MARK: - tableview datasource and delegate
extension BoardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.sectionType(at: indexPath) {
        case .ImagePost:
            if let viewModel = viewModel.dataForRow(at: indexPath) as? PopularImagePostViewModel {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.popularImagePostTableViewCell, for: indexPath)!
                cell.configureCell(with: viewModel)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.imageInsertionPostTableViewCell, for: indexPath)!
                return cell
            }
        case .LoadMore:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.loadMoreTableViewCell, for: indexPath)!
            cell.configureCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch viewModel.sectionType(at: indexPath) {
        case .LoadMore:
            viewModel.loadMoreImage()
        default:
            return
        }
    }
    
}


