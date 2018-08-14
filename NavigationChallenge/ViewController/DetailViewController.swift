//
//  DetailViewController.swift
//  NavigationChallenge
//
//  Created by Daniel Gunawan on 14/08/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailTable: UITableView!
    var options: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTable.delegate = self
        detailTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : TABLE VIEW DATA SOURCE DELEGATE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Details", for: indexPath) as! DetailSelectionTableViewCell
        
        cell.itemImageView.image = UIImage(named: options[indexPath.row])
        cell.titleLabel.text = options[indexPath.row]
        
        return cell;
    }
}
