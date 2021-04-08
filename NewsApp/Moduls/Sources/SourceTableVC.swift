//
//  SourceTableVC.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

import UIKit

class SourceTableVC: UITableViewController {
    
    weak var coordinator: SourceCoordinator?
    weak var viewModel: SourceViewModel?
    
    let searchController = UISearchController(searchResultsController: nil)

    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: SourceCell.self)
        tableView.tableFooterView = UIView()
        
        navigationItem.largeTitleDisplayMode = .never
    
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search news name"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        bindViewModel()
        viewModel?.processGetSource()
    }
    
    func bindViewModel() {
        viewModel?.changeHandler = { changes in
            switch changes {
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
        
        viewModel?.changeHandlerFilter = { change in
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
        if isFiltering {
            return viewModel?.filteredSources.count ?? 0
        }
        
        return viewModel?.sources.count ?? 0
       
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: SourceCell.self, for: indexPath)
        if isFiltering {
            if let sourceFilter = viewModel?.filteredSources[indexPath.row] {
                cell.bind(with: sourceFilter)
            }
            return cell
        } else {
            if let source = viewModel?.sources[indexPath.row] {
                cell.bind(with: source)
            }
        }
      
       
        return cell
        
       
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.processShowArticle(indexPath: indexPath)
    }
  
    

}

extension SourceTableVC: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
     
        let searchBar = searchController.searchBar
        viewModel?.filterForSource(searchBar.text!)
        bindViewModel()
    }
}



