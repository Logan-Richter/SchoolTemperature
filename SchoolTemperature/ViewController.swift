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
    var sequeIdentfiers = ["161","162","163","164","165"]
var tempArray = ["76","83","68","71","77","67","70","69","79","66","82","84","68","65","66","72","73","76","83","68","71","77","67","70","69","79","66","82","84","68","65","66","72","73"]
    let defaults = UserDefaults.standard
    var rooms = String()
    var newRoom = [String]()
    {
        didSet
        {
            self.defaults.set(newRoom, forKey: rooms)
        }
    }

    override func viewWillAppear(_ animated: Bool)
    {
        if let saveData = defaults.object(forKey: rooms) as? [String]
        {
            newRoom = saveData
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Room Numbers"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return newRoom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let room = newRoom[indexPath.row]
        let temp = tempArray[indexPath.row]
        cell.textLabel?.text = room
        cell.detailTextLabel?.text = temp
        return cell
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem)
    {
     alert()
    }
    
    func alert()
    {
        let alert = UIAlertController(title: "New Room", message: "Add Room Here", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Add", style: .default)
        {
            (action) in
            let roomTextField = alert.textFields![0] as UITextField
            let room2 = roomTextField.text
            self.newRoom.append(room2!)
            self.tableView.reloadData()
        }
        alert.addTextField
            {
                (textField) in textField.placeholder = "Enter Room"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addAction(okayAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        self.newRoom.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
//    {
//        performSegue(withIdentifier: sequeIdentfiers[indexPath.row], sender: self)
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "161"
        {
            let nvc = segue.destination as! Room161ViewController
            let indexPath = tableView.indexPathForSelectedRow?.row
            nvc.test = newRoom[indexPath!]
        }
        else if segue.identifier == "162"
        {
            let nvc = segue.destination as! Room162ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test2 = newRoom[indexPath!]
        }
        else if segue.identifier == "163"
        {
            let nvc = segue.destination as! Room163ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test3 = newRoom[indexPath!]
        }
        else if segue.identifier == "164"
        {
            let nvc = segue.destination as! Room164ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test4 = newRoom[indexPath!]
        }
        else if segue.identifier == "165"
        {
            let nvc = segue.destination as! Room165ViewController
            let indexPath = self.tableView.indexPathForSelectedRow?.row
            nvc.test5 = newRoom[indexPath!]
         }
    }
}
