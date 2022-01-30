//
//  PaginationCollectionCell.swift
//  test-indra-peliculas
//
//  Created by Miguel on 30/01/22.
//

import UIKit

protocol PaginationCollectionCellDelegate {
    func getPage(page: Int)
}

class PaginationCollectionCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var delegate: PaginationCollectionCellDelegate?
    var page: Int = 0
    var pageTotal :Int = 10
    static var identifier = "PaginationCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(page:Int) {
        self.page = page
        self.validatePage()
        self.descriptionLabel.text = "** \(self.page) / \(self.pageTotal) **"
    }
    
    @IBAction func leftAction(_ sender: UIButton) {
        self.page = self.page - 1
        self.validatePage()
        delegate?.getPage(page: self.page)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        self.page = self.page + 1
        self.validatePage()
        delegate?.getPage(page: self.page)
    }
    func validatePage() {
        if self.page <= 0 {
            self.page = 1
        } else if self.page > self.pageTotal {
            self.page = self.pageTotal
        }
    }
}
