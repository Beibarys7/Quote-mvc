//
//  Quote.swift
//  Quote-mvc
//
//  Created by Бейбарыс Шагай on 10/21/20.
//

import Foundation

struct Quote {
    let id: Int
    var name: String
    let price: Double
    let symbol: String
    let logoUrl: String
    let rank: Int
    let priceDate: String
    let priceStamp: String
    let marketCap: Int
    let circulatingSupply: Int //snackcase
    let maxSupply: Double //camelCase
//    let oneDay: OneDay
    let imageName: String
    
    struct OneDay {
        let  volume: Double
        let  price_change: Double
        let  price_change_pct: Double
        let  volume_change: Double
        let  volume_change_pct: Double
        let  market_cap_change: Double
        let  market_cap_change_pct: Double
        
    }
}
