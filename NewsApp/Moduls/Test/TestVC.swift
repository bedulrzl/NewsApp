//
//  TestVC.swift
//  NewsApp
//
//  Created by Aprizal on 8/4/21.
//

import UIKit

class TestVC: UITableViewController {
    
    weak var coordinator: TestCoordinator?
    var viewModel: TestViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.processGetTest()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    
}
