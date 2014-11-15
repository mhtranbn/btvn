//
//  ShopVC.swift
//  ParisGateuax
//
//  Created by mhtran on 11/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit


class ShopVC: UITableViewController {
    
    var tableData: [String] = ["Paris Gâteaux - Hai Bà Trưng", "Paris Gâteaux - Thái Hà", "Paris Gâteaux - Parkson Keang Nam", "Paris Gâteaux - Tràng Thi", "Paris Gâteaux - Hoàng Đạo Thúy", "Paris Gâteaux - Tôn Đức Thắng", "Paris Gâteaux - Trần Đại Nghĩa", "Paris Gâteaux - Nguyễn Khánh Toàn", "Paris Gâteaux - Nguyễn Thị Định", "Paris Gâteaux - Tăng Bạt Hổ", "Paris Gâteaux - Tô Hiến Thành"]
    var tableSubtitles: [String] = ["1A Hai Bà Trưng, Quận Hoàn Kiếm, Hà Nội", "34-36 Thái Hà, Quận Đống Đa, Hà Nội", "Phạm Hùng, Quận Cầu Giấy, Hà Nội", "75 Tràng Thi, Quận Hoàn Kiếm, Hà Nội", "1F, VP3-17T5 Hoàng Đạo Thúy, Quận Thanh Xuân, Hà Nội", "140 Tôn Đức Thắng, Quận Đống Đa, Hà Nội", "2A Trần Đại Nghĩa, Quận Hai Bà Trưng, Hà Nội", "1A2 Nguyễn Khánh Toàn, Quận Cầu Giấy, Hà Nội", "62 Nguyễn Thị Định, Quận Cầu Giấy, Hà Nội", "1A Tăng Bạt Hổ, Quận Hai Bà Trưng, Hà Nội", "30 Tô Hiến Thành, Quận Hai Bà Trưng, Hà Nội"]
    var phoneNum: [String] = ["(04) 62 702 518", "(04) 35 380 118", "(04) 38 378 287", "(04) 39 387 771", "(04) 62 512 006", "(04) 37 327 089", "(04) 36 285 298", "(04) 22 813 288", "(04) 35 553 567", "(04) 39 729 399", "(04) 89 168 227"]


    var data: Array<ShopData> = Array<ShopData>()
    override func loadView() {
        super.loadView()
        initData()
       
        
    }

    func initData() {
        for var i = 0; i < tableData.count; i++ {
        data.append(ShopData(title: tableData[i], subtitle: tableSubtitles[i]))
        }
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell!
        if let dequeCell = tableView.dequeueReusableCellWithIdentifier("#") as? UITableViewCell {
            cell = dequeCell
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "#")
        }
        
        let shopData = data[indexPath.row] as ShopData
        cell.textLabel.text = shopData.title
        cell.detailTextLabel?.text = shopData.subtitle
        return cell

    }
    

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertView()
        alert.title = "Phone Number"
        alert.message = phoneNum[indexPath.row]
        NSLog("da kich vo \(indexPath.row)")
        alert.addButtonWithTitle("Close")
        alert.show()
        
    }

    
}
