//
//  ViewController.swift
//  TableView
//
//  Created by IMCS2 on 2/13/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var sldierValue: UILabel!
    var parameters:Int = 0
    
    @IBAction func slider(_ sender: UISlider) {
        parameters = Int(sender.value)
        sldierValue.text = String(parameters)
        data.removeAll()
        update()
        self.tableView.reloadData()

    }
    
    @IBOutlet weak var tableView: UITableView!
    private var data: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! //1.
        
        let text = data[indexPath.row] //2.
        
        cell.textLabel?.text = text //3.
        
        return cell //4.

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        for i in 0...50 {
            
            data.append(" \(i * Int(sldierValue.text!)!) ")
        }
        
        tableView.dataSource = self
    }

    func update(){
        for i in 1...50 {
            data.append("\(i) * \(parameters) = \(i*parameters)")
        }
    }

}

