//
//  DetailViewController.swift
//  Curr3ncy
//
//  Created by Ali Demirtaş on 16.08.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var forthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var sixthButton: UIButton!
    @IBOutlet weak var convertLabel: UILabel!
    var label = ""
    var currencyName = ""
    var delegate: CurrencyManagerDelegate?
    
    var currencyManager = CurrencyManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertLabel.text = label
        currencyManager.delegate = self
        buttonChanged()
       
    }
    @IBAction func currencyButtonTapped(_ sender: UIButton) {
        currencyName = sender.currentTitle!
            print(currencyName)
            print(label)
         currencyManager.fetchCurrency(from: currencyName, to: label)
    }
    
}

extension DetailViewController: CurrencyManagerDelegate {
    func updateCurrency(_ currencyManager: CurrencyManager, currency: CurrecyModel) {
        DispatchQueue.main.async {
            self.convertLabel.text = "1 \(currency.fromCurrency) = \(currency.result) \(currency.toCurrenct)"
        }
    }
    
    func didFailWithError(error: Error) {
    }
    
    
}


extension DetailViewController {
    func buttonChanged() {
        if label == "TRY" {
            firstButton.setTitle("RUB", for: [])
            secondButton.setTitle("CHF", for: [])
            thirdButton.setTitle("CAD", for: [])
            forthButton.setTitle("GBP", for: [])
            fifthButton.setTitle("EUR", for: [])
            sixthButton.setTitle("AUD", for: [])
        }
        if label == "RUB" {
            firstButton.setTitle("TRY", for: [])
            secondButton.setTitle("CHF", for: [])
            thirdButton.setTitle("CAD", for: [])
            forthButton.setTitle("GBP", for: [])
            fifthButton.setTitle("EUR", for: [])
            sixthButton.setTitle("AUD", for: [])
        }
        if label == "CHF" {
            firstButton.setTitle("RUB", for: [])
            secondButton.setTitle("TRY", for: [])
            thirdButton.setTitle("CAD", for: [])
            forthButton.setTitle("GBP", for: [])
            fifthButton.setTitle("EUR", for: [])
            sixthButton.setTitle("AUD", for: [])
        }
        if label == "CAD" {
            firstButton.setTitle("RUB", for: [])
            secondButton.setTitle("CHF", for: [])
            thirdButton.setTitle("TRY", for: [])
            forthButton.setTitle("GBP", for: [])
            fifthButton.setTitle("EUR", for: [])
            sixthButton.setTitle("AUD", for: [])
        }
        if label == "GBP" {
            firstButton.setTitle("RUB", for: [])
            secondButton.setTitle("CHF", for: [])
            thirdButton.setTitle("CAD", for: [])
            forthButton.setTitle("TRY", for: [])
            fifthButton.setTitle("EUR", for: [])
            sixthButton.setTitle("AUD", for: [])
        }
        if label == "EUR" {
            firstButton.setTitle("RUB", for: [])
            secondButton.setTitle("CHF", for: [])
            thirdButton.setTitle("CAD", for: [])
            forthButton.setTitle("GBP", for: [])
            fifthButton.setTitle("TRY", for: [])
            sixthButton.setTitle("AUD", for: [])
        }
        if label == "AUD" {
            firstButton.setTitle("RUB", for: [])
            secondButton.setTitle("CHF", for: [])
            thirdButton.setTitle("CAD", for: [])
            forthButton.setTitle("GBP", for: [])
            fifthButton.setTitle("EUR", for: [])
            sixthButton.setTitle("TRY", for: [])
        }
    }
}
