//
//  ViewController.swift
//  NavigationChallenge
//
//  Created by Daniel Gunawan on 14/08/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var orderSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToOrder" {
            if let orderVC = segue.destination as? OrderViewController {
                orderVC.customerName = self.nameTextField.text
                orderVC.customerEmail = self.emailTextField.text
            }
        }
    }
    
    @IBAction func orderButtonPressed(_ sender: UIButton) {
        if let name = nameTextField.text, !name.isEmpty {
            performSegue(withIdentifier: "ToOrder", sender: self)
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.nameTextField.transform = CGAffineTransform(translationX: 20, y: 0)
            }) { (_) in
                UIView.animate(withDuration: 0.3) {
                    self.nameTextField.transform = CGAffineTransform.identity
                }
            }
        }
    }
}

