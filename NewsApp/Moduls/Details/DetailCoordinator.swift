//
//  DetailCoordinator.swift
//  NewsApp
//
//  Created by Aprizal on 27/3/21.
//

import UIKit

class DetailCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var article: Article!
    
    init(navigationController: UINavigationController, article: Article) {
        self.navigationController = navigationController
        self.article = article
    }
    
    
    func start() {
        let viewController = DetailVC()
        let viewModel = DetailViewModel()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            viewModel.article = self.article
            viewController.title = self.article.source.name
        }
    }
}
