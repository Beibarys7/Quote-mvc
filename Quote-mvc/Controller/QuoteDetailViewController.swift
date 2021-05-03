//
//  QuoteDetailViewController.swift
//  Quote-mvc
//
//  Created by Бейбарыс Шагай on 10/23/20.
//

import UIKit

class QuoteDetailViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var quote: Quote?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let quote = quote {
            self.title = quote.name
            nameLabel.text = quote.name
            priceLabel.text = String(format: "%.4f", quote.price)
            
            iconImageView.image = UIImage(named: quote.imageName)
            
        }
    }
}
