//
//  DetailViewController.swift
//  NavigationChallenge
//
//  Created by Daniel Gunawan on 14/08/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailSelectionCellDelegate {
    
    @IBOutlet weak var detailTable: UITableView!
    
    var options: [String] = []
    var ingredientType: IngredientType = .base // base as default
    var ingredientQuantity = [String : Double]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTable.delegate = self
        detailTable.dataSource = self
        
        detailTable.estimatedRowHeight = 100
        detailTable.rowHeight = UITableViewAutomaticDimension
        
        let ingredientData = IngredientData()
        
        switch ingredientType {
        case .base:
            self.options = ingredientData.bases
        case .dressing:
            self.options = ingredientData.dressings
        case .protein:
            self.options = ingredientData.proteins
        case .supplement:
            self.options = ingredientData.supplemets
        case .topping:
            self.options = ingredientData.toppings
        }
    }

    // MARK : TABLE VIEW DATA SOURCE DELEGATE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Details", for: indexPath)
        
        if let cell = cell as? DetailSelectionTableViewCell {
            cell.itemImageView.image = UIImage(named: options[indexPath.row])
            cell.titleLabel.text = options[indexPath.row]
            cell.delegate = self
        }
        
        return cell;
    }
    
    // MARK : DETAIL CELL DELEGATE
    func updateQuantity(for ingredientName: String, quantity: Double) {
        print("\(ingredientName) : \(quantity)")
        self.ingredientQuantity.updateValue(quantity, forKey: ingredientName)
    }
    
}
