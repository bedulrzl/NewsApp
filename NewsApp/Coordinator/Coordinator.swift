//
//  Coordinator.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
