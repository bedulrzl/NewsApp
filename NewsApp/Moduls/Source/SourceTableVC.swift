//
//  SourceTableVC.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

import UIKit

class SourceTableVC: UITableViewController {
    
    weak var viewModel: SourceViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(cellType: SourceCell.self)
        bindViewModel()
        viewModel?.processGetSource()
    }
    
    func bindViewModel() {
        viewModel?.changeHandler = { change in
            switch change {
            case .updateDataModel:
                self.tableView.reloadData()
            case .error(let message):
                print(message)
            case .loaderStart:
                break
            case .loaderEnd:
                break
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: SourceCell.self, for: indexPath)
        if let article = viewModel?.articles[indexPath.row] {
            cell.bind(with: article)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}
