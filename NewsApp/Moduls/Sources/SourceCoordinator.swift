//
//  SourceCoordinator.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

import UIKit

class SourceCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    private var category: String = ""
    
    init(navigationController: UINavigationController, category: String) {
        self.navigationController = navigationController
        self.category = category
    }
    
    func start() {
        let sourceVC = SourceTableVC()
        let viewModel = SourceViewModel(categoryName: category)
        sourceVC.viewModel = viewModel
        viewModel.didSelectedSource = { id in
            self.startArticle(with: id)
        }
        sourceVC.title = category
        navigationController.pushViewController(sourceVC, animated: true)
    }
}

extension SourceCoordinator {
    func startArticle(with id: String) {
        let articleCoordinator = ArticleCoordinator(navigationController: navigationController, id: id)
        articleCoordinator.start()
    }
}
