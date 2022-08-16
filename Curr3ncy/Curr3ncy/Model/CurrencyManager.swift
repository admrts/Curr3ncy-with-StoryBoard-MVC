//
//  CurrencyManager.swift
//  Curr3ncy
//
//  Created by Ali Demirtaş on 17.08.2022.
//

import Foundation
protocol CurrencyManagerDelegate {
    func updateCurrency(_ currencyManager: CurrencyManager, currency: CurrecyModel)
    func didFailWithError(error: Error)
}




struct CurrencyManager {
    var delegate: CurrencyManagerDelegate?
    
    
    func fetchCurrency(from: String, to: String) {
        let urlString = "https://api.apilayer.com/currency_data/convert?to=\(to)&from=\(from)&amount=1&apikey=5eDS2vSwzTkrQHHT2vmtBJrTRl3jtTFw"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let currency = parseJSON(safeData) {
                        delegate?.updateCurrency(self, currency: currency)
                    }
                }
            }
            task.resume()
        }
        
        
        
    }
    
    
    func parseJSON(_ currencyData: Data) -> CurrecyModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            let from = decodedData.query.from
            let to = decodedData.query.to
            let result = decodedData.result
            
            let currency = CurrecyModel(fromCurrency: from, toCurrenct: to, result: result)
            return currency
            
        } catch  {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
