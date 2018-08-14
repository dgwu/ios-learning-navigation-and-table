//
//  OrderViewController.swift
//  NavigationChallenge
//
//  Created by Daniel Gunawan on 14/08/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var customerName: String?
    var customerEmail: String?
    
    var dataBowl: [IngredientType] = [.base, .protein, .topping, .supplement, .dressing]
    var selectedType: IngredientType?
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var bowlTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customerName = customerName {
            self.greetingLabel.text = "Hi, \(customerName)!"
        }
        
        bowlTableView.delegate = self
        bowlTableView.dataSource = self
        
        bowlTableView.estimatedRowHeight = 75
        bowlTableView.rowHeight = UITableViewAutomaticDimension
        
        
        // Do any additional setup after loading the view.
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    // MARKS: DATA SOURCE DELEGATE METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBowl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Sukasuka", for: indexPath) as! SelectionTableViewCell
        cell.titleLabel.text = dataBowl[indexPath.row].rawValue
        return cell
    }
    
    // MARKS: TABLE VIEW DELEGATE
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("ouch! \(self.dataBowl[indexPath.row].rawValue)")
        self.selectedType = dataBowl[indexPath.row]
        
        performSegue(withIdentifier: "ToDetail", sender: self)
    }
    
    // MARKS: NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let ingredientData = IngredientData.init()
            
            if let selectedType = selectedType {
                switch selectedType {
                case .base:
                    destination.options = ingredientData.bases
                case .dressing:
                    destination.options = ingredientData.dressings
                case .protein:
                    destination.options = ingredientData.proteins
                case .supplement:
                    destination.options = ingredientData.supplemets
                case .topping:
                    destination.options = ingredientData.toppings
                }
            }
        }
    }
}
