//
//  ViewController.swift
//  SchoolTemperature
//
//  Created by period3 on 10/29/18.
//  Copyright © 2018 StormCloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    var tableArray = ["Room 161", "Room 162", "Room 163", "Room 164", "Room 165"]
    var results = [[String: String]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Room Numbers"
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let room = tableArray[indexPath.row]
        cell.textLabel?.text = room
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let nvc = segue.destination as! Room161ViewController
        let indexPath = self.tableView.indexPathForSelectedRow?.row
    }

}
