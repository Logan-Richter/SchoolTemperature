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
   var tableArray = ["Room 161","Room 162","Room 163","Room 164","Room 165"]
    var sequeIdentfiers = ["161","162","163","164","165"]
    var tempArray = ["76","83","68","71","77"]
    
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
        let temp = tempArray[indexPath.row]
        cell.textLabel?.text = room
        cell.detailTextLabel?.text = temp
        return cell
    }
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
//    {
        //performSegue(withIdentifier: sequeIdentfiers[indexPath.row], sender: self)
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "161"
        {
            let nvc = segue.destination as! Room161ViewController
            let indexPath = tableView.indexPathForSelectedRow?.row
            nvc.test = tableArray[indexPath!]
        }
        else if segue.identifier == "162"
        {
            let nvc = segue.destination as! Room162ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test2 = tableArray[indexPath!]
        }
        else if segue.identifier == "163"
        {
            let nvc = segue.destination as! Room163ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test3 = tableArray[indexPath!]
        }
        else if segue.identifier == "164"
        {
            let nvc = segue.destination as! Room164ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test4 = tableArray[indexPath!]
        }
        else if segue.identifier == "165"
        {
            let nvc = segue.destination as! Room165ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test5 = tableArray[indexPath!]
         }
    }
}
