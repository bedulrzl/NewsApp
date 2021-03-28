//
//  ArticleTableVC.swift
//  NewsApp
//
//  Created by Aprizal on 26/3/21.
//

import UIKit

class ArticleTableVC: UITableViewController {
//
    weak var coordinator: ArticleCoordinator?
    var viewModel: ArticleViewModel?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(cellType: ArticleCell.self)
        tableView.tableFooterView = UIView()
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by Title"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        bindViewModel()
        viewModel?.processGetArticle()
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
        
        viewModel?.changeHandlerFilter = { changes in
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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.isFiltering {
            return self.viewModel?.filteredArticle.count ?? 0
        }
        return viewModel?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ArticleCell.self, for: indexPath)
        if isFiltering {
            if let articleFilter = viewModel?.filteredArticle[indexPath.row] {
                cell.bind(with: articleFilter)
            }
            return cell
        } else {
            if let article = viewModel?.articles[indexPath.row] {
                cell.bind(with: article)
            }
           return cell
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.processShowDetail(indexPath: indexPath)
    }
  
    
}

extension ArticleTableVC: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel?.filteredForArticle(searchBar.text!)
    }
}
