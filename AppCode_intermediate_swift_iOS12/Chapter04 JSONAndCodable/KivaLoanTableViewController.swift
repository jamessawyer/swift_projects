//
//  KivaLoanTableViewController.swift
//  Chapter04 JSONAndCodable

/// 处理JSON数据的2种方式
/// 1.使用 JSONSerialization
/// 2.使用Codable协议 将json转换为想要的数据类型


import UIKit

class KivaLoanTableViewController: UITableViewController {
    private let kivaLoanURL = "https://api.kivaws.org/v1/loans/newest.json"
    private var loans = [Loan]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getLatestLoans()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return loans.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KivaLoanTableViewCell

        cell.setupCell(loan: loans[indexPath.row])
        return cell
    }

}

extension KivaLoanTableViewController {
    func getLatestLoans() {
        print("get loans")
        guard let loanUrl = URL(string: kivaLoanURL) else { return }
        
        let request = URLRequest(url: loanUrl)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                self.loans = self.parseDataUsingCodable(data: data)
//                self.loans = self.parseJsonData(data: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        task.resume()
    }
    
    /// 方式2
    /// 使用 Codable 中的 JSONDecoder 对json数据进行解析
    func parseDataUsingCodable(data: Data) -> [Loan] {
        var loans = [Loan]()
        let decoder = JSONDecoder()
        
        do {
            let loanDataStore = try decoder.decode(LoanDataStore.self, from: data)
            loans = loanDataStore.loans
        } catch {
            print("error \(error)")
        }
        
        return loans
    }
    
    /// 方式1 使用 JSONSerialization 对json数据进行解析
//    func parseJsonData(data: Data) -> [Loan] {
//        var loans = [Loan]()
//
//        do {
//            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
//
//            // 解析JSON
//            let jsonLoans = jsonResult?["loans"] as! [AnyObject]
//            for jsonLoan in jsonLoans {
//                var loan = Loan()
//                loan.name = jsonLoan["name"] as! String
//                loan.amount = jsonLoan["loan_amount"] as! Int
//                loan.use = jsonLoan["use"] as! String
//                let location = jsonLoan["location"] as! [String: AnyObject]
//                loan.country = location["country"] as! String
//                loans.append(loan)
//
//            }
//        } catch {
//            print("parse json error \(error)")
//        }
//
//        return loans
//    }
}
