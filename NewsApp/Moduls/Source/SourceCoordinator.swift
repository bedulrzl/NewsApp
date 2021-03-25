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
    private var name: String = ""
    
    init(navigationController: UINavigationController, name: String) {
        self.navigationController = navigationController
        self.name = name
    }
    
    func start() {
        let sourceTVC = SourceTableVC()
        let viewModel = SourceViewModel(SourceName: name)
        sourceTVC.viewModel = viewModel
        navigationController.pushViewController(sourceTVC, animated: true)
    }
}
