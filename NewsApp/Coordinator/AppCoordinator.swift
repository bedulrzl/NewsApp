//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import  UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let viewController = CategoryTableVC()
        let viewModel = CategoryViewModel()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        viewModel.didSelectCategory =  { category in
            self.startSource(with: category)
        }
        viewController.title = "Category"
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator {
    func startSource(with category: String) {
        let sourceCoordinator = SourceCoordinator(navigationController: navigationController, category: category)
        sourceCoordinator.start()
    }
}
