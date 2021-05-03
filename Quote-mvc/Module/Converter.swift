//
//  Converter.swift
//  Quote-mvc
//
//  Created by Бейбарыс Шагай on 10/21/20.
//

import Foundation

class Converter {
    
    var baseQuote: Quote
    
    init(baseQuote: Quote) {
        self.baseQuote = baseQuote
    }
    
    func Converter(convertQuote: Quote, amount: Double ) -> Double {
        
        let convertedAmount = amount * convertQuote.price/baseQuote.price
        
        return convertedAmount
    }
}
