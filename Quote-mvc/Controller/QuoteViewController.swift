//
//  QuoteViewController.swift
//  Quote-mvc
//
//  Created by Бейбарыс Шагай on 10/22/20.
//

import UIKit

class QuoteViewController: UITableViewController, QuoteProviderDelegate {
  
   
    private var quotes = [Quote]()
    private var quoteProvider: QuoteProvider?
    
    override func viewDidLoad() { // View шка загружен
        // запускается во время первого даного QuoteViewController
        // мы должны заполнить quotes массива работаем с QuoteProvider
        super.viewDidLoad()
        quoteProvider = QuoteProvider(delegate: self)
        
        quoteProvider!.loadQuotes()
        tableView.reloadData() // перезагрузка данных
        print(quotes)
    }
    
    func startLoading() {
        print("startLoading")
    }
    
    func updateQuotes(quotes: [Quote]) {
        self.quotes = quotes // Мы должны котировок класса обновить с новыми получиним котировок
        tableView.reloadData() // Здесь же обновить таблицу
    }
    
    @IBAction func refleshQuotesButton(_ sender: UIBarButtonItem) {
        quoteProvider!.loadQuotes()
       }
    
    func endLoading() {
           print("endLoading")

       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath) as? QuoteCell { // Если есть данные возвращаем ячейку, если нет то пустую
            print("Succsessfully quote cell")

            
            let index = indexPath.row // indexPath.row дает нам данного компонента позицию
            
            let quote = quotes[index]
            
            cell.iconImageView.image = UIImage(named: quote.imageName)
            cell.nameLabel.text = quote.name
            cell.priceLabel.text = String(format: "%.2f", quote.price) + " $"
            cell.idLabel.text = quote.id.description
            cell.maxSupplyLabel.text = "Supply \(quote.maxSupply.description) M"
            cell.symbolLabel.text = quote.symbol
            print(quote.name)
            print(quote.price)
            
            return cell
        }
        else {
            print("not dequeen")
        }
            return QuoteCell()
    }
    
    
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(quotes.count)
           return quotes.count
       }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.5
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // destination - это контроллер который бедет происходить переход
        // segue переход данного контроллер из любого другого контроллер
     

        if segue.identifier == "quotesToDetail",
            let cell = sender as? QuoteCell, // sender - это ячейка
            let indexPath = tableView.indexPath(for: cell),
            let detailVC = segue.destination as? QuoteDetailViewController {
            print("SUCCESS!!")
            detailVC.quote = quotes[indexPath.row]

        } else {
            print("if tin iwine kirgen jok")
        }
    }
}
