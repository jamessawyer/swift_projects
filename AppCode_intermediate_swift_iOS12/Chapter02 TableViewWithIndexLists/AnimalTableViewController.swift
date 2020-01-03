//
//  AnimalTableViewController.swift
//  Chapter02 TableViewWithIndexLists
//
//  Created by lucian on 2020/1/3.
//  Copyright © 2020 oscar. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {
    let animals = ["Bear", "Black Swan", "Buffalo", "Camel", "Cockatoo", "Dog", "Donkey", "Emu", "Giraffe", "Greater Rhea", "Hippopotamus", "Horse", "Koala", "Lion", "Llama", "Manatus", "Meerkat", "Panda", "Peacock", "Pig", "Platypus", "Polar Bear", "Rhinoceros", "Seagull", "Tasmania Devil", "Whale", "Whale Shark", "Wombat"]
    var animalsDict = [String: [String]]()
    var animalSectionTitles = [String]() // 上面animals所有首字母的分类
    let animalIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L" , "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    override func viewDidLoad() {
        super.viewDidLoad()

        createAnimalDict()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return animalSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        let animalKey = animalSectionTitles[section]
        guard let animalValues = animalsDict[animalKey] else {
            return 0
        }
        return animalValues.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let animalKey = animalSectionTitles[indexPath.section]
        if let animalValues = animalsDict[animalKey] {
            cell.textLabel?.text = animalValues[indexPath.row]
            
            let imageFilename = animalValues[indexPath.row].lowercased().replacingOccurrences(of: " ", with: "_")
            cell.imageView?.image = UIImage(named: imageFilename)
        }
        return cell
    }
    
    // 添加一个右边索引条
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return animalSectionTitles
//    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return animalIndexTitles
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        // 和实际包含的所有titles索引位置进行对比
        guard let index = animalSectionTitles.firstIndex(of: title) else {
            return -1
        }
        return index
    }
    
    

}

extension AnimalTableViewController {
    /// 将数据转换为["B": ["Bear", "Black Swan", "Buffalo"], "C": ["Camel", "Cockatoo"]] 这种数据类型
    func createAnimalDict() {
        for animal in animals {
            // 获取animal的名字
            let firstLetterIndex = animal.index(animal.startIndex, offsetBy: 1)
            // slice a string into a substring
            // animal[..<firstLetterIndex] 是一个 SubString 类型
            let animalKey = String(animal[..<firstLetterIndex])
            
            if var animalValues = animalsDict[animalKey] {
                // 如果存在该key 则将其添加到值里面 并且和key联系起来
                animalValues.append(animal)
                animalsDict[animalKey] = animalValues
            } else {
                animalsDict[animalKey] = [animal]
            }
        }
        
        // 从字典的keys中获取section titles 并按升序排列 并将其转换为大写
        animalSectionTitles = [String](animalsDict.keys).map {
            $0.capitalized
        }
        animalSectionTitles = animalSectionTitles.sorted(by: { $0 < $1 })
    }
}
