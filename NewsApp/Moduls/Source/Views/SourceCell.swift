//
//  SourceCell.swift
//  NewsApp
//
//  Created by Aprizal on 25/3/21.
//

import UIKit
import Kingfisher

class SourceCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageSource: UIImageView!
    @IBOutlet weak var labelDeskripsi: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with source: Article) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let theDate = dateFormatter.date(from: source.publishedAt)!
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "dd-MMM-yyyy"
        print(newDateFormater.string(from: theDate))
        
        labelTitle.text = "source.title"
        labelDeskripsi.text = source.description
        guard let url = URL(string: "\(source.urlToImage)") else { return }
        imageSource.kf.setImage(with: url)
        labelAuthor.text = source.author
        labelDate.text = newDateFormater.string(from: theDate)
    }
    
}
