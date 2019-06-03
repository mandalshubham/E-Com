//
//  CategoryListCell.swift
//  E-Com
//
//  Created by Shubham Mandal on 6/3/19.
//  Copyright © 2019 Shubham Mandal. All rights reserved.
//

import UIKit

class CategoryListCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(forCategory category: CategoryModel) {
        categoryLabel?.text = category.name
    }

}
