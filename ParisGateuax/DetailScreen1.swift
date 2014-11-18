//
//  DetailScreen1.swift
//  ParisGateuax
//
//  Created by mhtran on 11/17/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class DetailScreen1: UITableViewController {

    var cellID = "#"
    var data = Array<DetailStr>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: "DetailVC", bundle: nil)
        self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        initData()
        // Do any additional setup after loading the view.
    }

    func initData() {
        data.append(DetailStr(title: "B01 Donut", price: "$12", imagePath: "bread01.JPG"))
        data.append(DetailStr(title: "B03 Puoluo", price: "$15", imagePath: "bread02.JPG"))
        data.append(DetailStr(title: "B41 Bánh Croissants (6 bánh)", price: "$20", imagePath: "bread03.JPG"))
        data.append(DetailStr(title: "B42 Cà phê Đan Mạch", price: "$25", imagePath: "bread04.JPG"))
        data.append(DetailStr(title: "B44 Dâu tây xanh Đan Mạch", price: "$32", imagePath: "bread05.JPG"))
        data.append(DetailStr(title: "B46 Bánh Táo Đan Mạch", price: "$23", imagePath: "bread06.JPG"))
        data.append(DetailStr(title: "B61 Vua Hokkaido", price: "$27", imagePath: "bread07.JPG"))
        data.append(DetailStr(title: "B62 Bánh Cranberry", price: "$33", imagePath: "bread08.JPG"))
        data.append(DetailStr(title: "B63 Bánh Sôcôla Thụy Sĩ", price: "$25", imagePath: "bread09.JPG"))
        data.append(DetailStr(title: "B64 Mochi Cà phê", price: "$17", imagePath: "bread10.JPG"))
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: DetailVC!
        
        if let dequecell = tableView.dequeueReusableCellWithIdentifier("#", forIndexPath: indexPath) as? DetailVC {
            cell = dequecell
        }
        
        
        
        let DetailStr = data[indexPath.row]
        cell.title.text = DetailStr.title
        cell.priceDe.text = DetailStr.price
       // cell.imageDe.image = DetailStr.image
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
       // self.navigationController?.pushViewController(DetailBith(), animated: true)
        }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}



