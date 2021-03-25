//
//  CategoryCell.swift
//  NewsApp
//
//  Created by Aprizal on 24/3/21.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var labelCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func bind(with category: Category) {
        labelCategory.text = category.name
    }
    
}
