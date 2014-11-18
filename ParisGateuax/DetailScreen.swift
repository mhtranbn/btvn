//
//  DetailScreen.swift
//  ParisGateuax
//
//  Created by mhtran on 11/17/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class DetailScreen: UITableViewController {
    
    var cellID = "#"
//    var data = Array<DetailStr>()
    var t: Int = 0
    var data:MenuData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: "DetailVC", bundle: nil)
        self.tableView.registerNib(nibCell, forCellReuseIdentifier: cellID)
        //initData()
//        var backButton: UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem = backButton
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func setData(data:MenuData) {
        self.data = data
        
    }
    
//    func initData() {
//        
//        data.append(DetailStr(title: "C01 Opera (Pháp)", price: "$12", imagePath: "birthday01.JPG",detail: "dfdfbdfb"))
//        data.append(DetailStr(title: "C02 Tiramisu (Ý)", price: "$15", imagePath: "birthday02.JPG"))
//        data.append(DetailStr(title: "C03 Đại ngàn", price: "$20", imagePath: "birthday03.JPG"))
//        data.append(DetailStr(title: "C05 Caramel Pháp", price: "$25", imagePath: "birthday04.JPG"))
//        data.append(DetailStr(title: "C07 Thời đại hoàng kim", price: "$32", imagePath: "birthday05.JPG"))
//        data.append(DetailStr(title: "C08 Nho dâu tây xanh", price: "$23", imagePath: "birthday06.JPG"))
//        data.append(DetailStr(title: "C09 Ngọn lửa tình yêu", price: "$27", imagePath: "birthday07.JPG"))
//        data.append(DetailStr(title: "C10 Dâu tây pha lê", price: "$33", imagePath: "birthday08.JPG"))
//        data.append(DetailStr(title: "C12 Cà phê Ai-len", price: "$25", imagePath: "birthday09.JPG"))
//        data.append(DetailStr(title: "C24 Gấu Pooh (Táo)", price: "$17", imagePath: "birthday10.JPG"))
//        data.append(DetailStr(title: "C42 Nhím gai", price: "$21", imagePath: "birthday11.JPG"))
//        
//        
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return data!.detailData.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: DetailVC!
        
        if let dequecell = tableView.dequeueReusableCellWithIdentifier("#", forIndexPath: indexPath) as? DetailVC {
            cell = dequecell
        }
        
        

        let detailStr = data!.detailData[indexPath.row] as DetailStr
        cell.title.text = detailStr.title
        cell.priceDe.text = detailStr.price
        cell.imageDe.image = UIImage(named: detailStr.imagePath)
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(DetailBith(data:data!.detailData[indexPath.row]), animated: true)
        
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
