//
//  ViewController.swift
//  AnimalsTableViewPractice
//
//  Created by Ehsan Taghavi on 22.07.2022.
//

import UIKit

struct Group {
    let title: String
    let animals: [String]
}

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let animals: [String: [String]] = [
        "A": ["Ant Eater"],
        "B": ["Bear","Bird"],
        "C": ["Cat"],
        "D": ["Donkey", "Duck", "Dog"],
        "F": ["Fish","Frog"],
        "G": ["Gorilla","Gold Fish"],
        "L": ["Lion"],
        "M": ["Mouse", "Mountain Lion"],
        "P": ["Panther"],
        "R": ["Rabbit","Rat"],
        "S": ["Snake"],
        "T": ["Tiger","Turtle"],
    ]
    
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return table
    }()
    
    var models = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpData(){
        for (key,value) in animals{
            models.append(.init(title: key, animals: value))
        }
        models = models.sorted(by: {$0.title < $1.title})
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(
            x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height-view.safeAreaInsets.top
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return models[section].animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.section].animals[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String?{
        return models[section].title
    }
}

