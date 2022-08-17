//
//  CurrencyData.swift
//  Curr3ncy
//
//  Created by Ali Demirtaş on 17.08.2022.
//

import Foundation

struct CurrencyData: Codable {
    
    let query: Query
    let result: Double
    
}
struct Query: Codable {
    let from: String
    let to: String
}
