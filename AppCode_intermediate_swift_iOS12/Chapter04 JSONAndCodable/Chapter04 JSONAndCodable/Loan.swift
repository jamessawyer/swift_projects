//
//  Loan.swift
//  Chapter04 JSONAndCodable
//
//  Created by lucian on 2020/1/5.
//  Copyright © 2020 oscar. All rights reserved.
//

/// 实际返回的数据结构可以查看 data.json

import Foundation

/// 方式1 使用 JSONSerialization
//struct Loan {
//    var name: String = ""
//    var country: String = ""
//    var use: String = ""
//    var amount: Int = 0
//}

/**
 数据结构类似为
 {name: "", location: { country: "" }, "loan_amount": 150, use: ""}
 */
struct Loan: Decodable {
    var name: String = ""
    var country: String = ""
    var use: String = ""
    var amount: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    /// 因为 country 嵌套在 {location: { country: "" } } 中
    /// 所以我们需要再定义一个key
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        
        /// 取出嵌套的json数据
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        country = try location.decode(String.self, forKey: .country)
        
        use = try values.decode(String.self, forKey: .use)
        amount = try values.decode(Int.self, forKey: .amount)
    }
}

/**
  数据结构为 {paging: {}, loans: []}
   但是我们需要的智勇 loans: [] 部分
   则可以再定义一个结构体的形式取出想要的部分
 */
struct LoanDataStore: Decodable {
    var loans: [Loan]
}
