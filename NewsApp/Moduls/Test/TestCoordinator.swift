//
//  TestCoordinator.swift
//  NewsApp
//
//  Created by Aprizal on 8/4/21.
//

import Foundation
import UIKit

class TestCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    private var id: Int = 0
    
    init(navigationController: UINavigationController, id: Int) {
        self.navigationController = navigationController
        self.id = id
    }
    
    func start() {
        let TestVc = TestVC()
        let viewModel = TestViewModel(idTest: id)
        TestVc.coordinator = self
        TestVc.viewModel = viewModel
        
        navigationController.pushViewController(TestVc, animated: true)
        
    }
}

extension ArticleCoordinator {
    func startDetail(article: Article) {
        let coordinator = DetailCoordinator(navigationController: self.navigationController, article: article)
        coordinator.start()
    }
}
