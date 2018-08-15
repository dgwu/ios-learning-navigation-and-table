//
//  DetailSelectionTableViewCell.swift
//  NavigationChallenge
//
//  Created by Daniel Gunawan on 14/08/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

protocol DetailSelectionCellDelegate {
    func updateQuantity(for ingredientName: String, quantity: Double)
}

class DetailSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    var delegate : DetailSelectionCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func changeQuantity(_ sender: UIStepper) {
        self.quantityLabel.text = String.init(format: "%.f", sender.value)
        delegate?.updateQuantity(for: self.titleLabel.text!, quantity: sender.value)
    }
    
}
