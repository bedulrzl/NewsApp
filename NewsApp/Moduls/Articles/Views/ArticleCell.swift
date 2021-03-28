//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Aprizal on 26/3/21.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
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
    
    func bind(with article: Article) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "dd-MMM-yyyy"
        
      

        labelTitle.text = article.title
        labelDeskripsi.text = article.articleDescription
        guard let url = URL(string: "\(article.urlToImage ?? "")") else { return }
        if article.urlToImage == nil {
            let image: UIImage = UIImage(named: "noimage")!
            imageArticle = UIImageView(image: image)
        } else {
            imageArticle.kf.setImage(with: url)
        }

        labelAuthor.text = article.author
        
        if let theDate = dateFormatter.date(from: article.publishedAt) {
//            print(newDateFormater.string(from: theDate))
            labelDate.text = newDateFormater.string(from: theDate)
        }
       
    }
    
}
