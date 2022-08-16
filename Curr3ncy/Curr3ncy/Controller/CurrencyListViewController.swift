//
//  CurrencyListViewController.swift
//  Curr3ncy
//
//  Created by Ali Demirtaş on 16.08.2022.
//

import UIKit

class CurrencyListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var currencyList = ["TRY","CAD","GBP","EUR","CHF","AUD","RUB"]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currencyName = sender as? String {
            if segue.identifier == "goToDetail" {
                let goVC = segue.destination as! DetailViewController
                goVC.label = currencyName
            }
        }
       
        
    }

}


//MARK: - TableView Datasource & Delegate

extension CurrencyListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currencyList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currencyName = currencyList[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: currencyName)
    }
}
