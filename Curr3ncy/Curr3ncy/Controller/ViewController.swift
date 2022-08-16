//
//  ViewController.swift
//  Curr3ncy
//
//  Created by Ali Demirtaş on 16.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "go", sender: nil)
    }
    
}

