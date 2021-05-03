//
//  QuoteProvider.swift
//  Quote-mvc
//
//  Created by Бейбарыс Шагай on 10/21/20.
//

import Foundation

protocol QuoteProviderDelegate { // protocol интерфейс как java  у нас он как закон и пишется функционал
    func startLoading()
    func updateQuotes(quotes: [Quote]) // возвращает массив кортировок
    func endLoading()
}

class QuoteProvider {
    
    private let delegate: QuoteProviderDelegate // delegate для того чтобы код работал гибким
    let names = ["Bitcoin", "XRP", "Ethereum"]
    let imageNames = ["bitcoin", "ethereum", "xrp"]
    let symbols = ["BTC", "XRP", "ETH"]
    
    required init(delegate: QuoteProviderDelegate) {
        self.delegate = delegate
    }
    
    func loadQuotes() { // Симилируем данных из сетий
        delegate.startLoading()
        let quotes = generateQuotes()
        delegate.updateQuotes(quotes: quotes) // передаем кортировок
        delegate.endLoading()
    }
    
    func generateQuotes() -> [Quote] {
        return names.enumerated().map { index, item in Quote (
            id: index + 1,
            name: item,
            price: Double.random(in: 1 ... 10000),
            symbol: symbols[index],
            logoUrl:"https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
            rank: 1,
            priceDate: "2020-04-16T00:00:00Z",
            priceStamp: "2020-10-21T17:42:00Z",
            marketCap: 236616444577,
            circulatingSupply: 18523231,
            maxSupply: 17.9,
            imageName: imageNames[index])
        }
    }
}
