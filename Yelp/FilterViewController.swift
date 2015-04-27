//
//  FilterViewController.swift
//  Yelp
//
//  Created by Joe Gasiorek on 4/25/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol FilterViewControllerDelegate {
    optional func filterViewController(filterViewController: FilterViewController, didUpdateFilters filters: [String:AnyObject])
}

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellTableViewCellDelegate, SortTableViewCellDelegate, TextTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [[String:String]]!
    var switchStates: [Int:Bool]!
    var sort: YelpSortMode = YelpSortMode.BestMatched
    var deals: Bool = false
    var radius = ""
    
    weak var delegate: FilterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        categories = yelpCategories()
        switchStates = [Int:Bool]()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func onSearch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        var filters = [String:AnyObject]()
        
        var selectedCategories = [String]()
        for (row,isSelected) in switchStates {
            if isSelected {
                selectedCategories.append(categories[row]["code"]!)
            }
        }
        
        if selectedCategories.count > 0 {
            filters["categories"] = selectedCategories
        }
        
        filters["sort"] = sort.rawValue ?? YelpSortMode.BestMatched.rawValue
        filters["radius"] = radius
        filters["deals"] = deals
        
        delegate?.filterViewController?(self, didUpdateFilters: filters)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return categories.count
            default:
                return 1
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell") as! SwitchCellTableViewCell
        
            cell.switchLabel.text = categories[indexPath.row]["name"]
            cell.delegate = self
        
            cell.onSwitch.on = switchStates[indexPath.row] ?? false
        
            return cell
        } else if indexPath.section == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("SortCell") as! SortTableViewCell
            cell.delegate = self
            return cell
        } else if indexPath.section == 2 {
            var cell = tableView.dequeueReusableCellWithIdentifier("TextViewCell") as! TextTableViewCell
            cell.delegate = self
            return cell
        } else {
            var cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell") as! SwitchCellTableViewCell
            cell.switchLabel.text = "Deals"
            cell.delegate = self
            cell.onSwitch.on = deals
            return cell
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
            case 0:
                return "Categories"
            case 1:
                return "Sort"
            case 2:
                return "Radius"
            case 3:
                return "Deals"
            default:
                return ""
        }
    }
    
    func switchCellTableViewCell(cell: SwitchCellTableViewCell, didChangedValue: Bool) {
        let indexPath = tableView.indexPathForCell(cell)!
        if indexPath.section == 0 {
            switchStates[indexPath.row] = didChangedValue
        } else {
            deals = didChangedValue
        }
    }

    func sortTableViewCell(cell:SortTableViewCell, value:YelpSortMode) {
        sort = value
    }
    
    func textTableViewCell(cell: TextTableViewCell, value: String) {
        radius = value
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    func yelpCategories() -> [[String:String]] {
        return [["name": "Afghan", "code": "afghani"],
                ["name": "Thai", "code": "thai"],
                ["name": "New American", "code": "newamerican"]]
    }
}
