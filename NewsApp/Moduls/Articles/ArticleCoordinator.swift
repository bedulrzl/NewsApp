//
//  ArticleCoordinator.swift
//  NewsApp
//
//  Created by Aprizal on 26/3/21.
//

import UIKit

class ArticleCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    private var id: String = ""
    
    init(navigationController: UINavigationController, id: String) {
        self.navigationController = navigationController
        self.id = id
    }
    
    func start() {
        let articleVC = ArticleTableVC()
        let viewModel = ArticleViewModel(sourceId: id)
        viewModel.didSelectedArticle = { article in
            self.startDetail(article: article)
        }
        
        articleVC.coordinator = self
        articleVC.viewModel = viewModel
        articleVC.title = id
        navigationController.pushViewController(articleVC, animated: true)
        
    }
}

extension ArticleCoordinator {
    func startDetail(article: Article) {
        let coordinator = DetailCoordinator(navigationController: self.navigationController, article: article)
        coordinator.start()
    }
}
