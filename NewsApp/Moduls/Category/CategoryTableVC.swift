//
//  CategoryTableVC.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import UIKit

class CategoryTableVC: UITableViewController {
    
    weak var coordinator: AppCoordinator?
    var viewModel: CategoryViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(cellType: CategoryCell.self)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
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
        return viewModel?.category.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: CategoryCell.self, for: indexPath)
        print(cell)
        if let category = viewModel?.category[indexPath.row] {
            cell.bind(with: category)
            print(category)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.processShowSource(indexPath: indexPath)
    }
    
}
