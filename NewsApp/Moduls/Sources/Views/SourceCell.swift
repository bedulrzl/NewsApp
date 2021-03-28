//
//  SourceCell.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

import UIKit
import Kingfisher

class SourceCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDeskripsi: UILabel!

    @IBOutlet weak var labelCountry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with source: Source) {
        labelName.text = source.name
        labelDeskripsi.text = source.sourceDescription

        labelCountry.text = source.country
    }
    
}
