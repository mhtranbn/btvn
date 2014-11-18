//
//  MenuVC.swift
//  ParisGateuax
//
//  Created by mhtran on 11/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit
import AVFoundation

class MenuVC: UIViewController {

    var audioPlayer = AVAudioPlayer()
    override func loadView() {
        super.loadView()
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    var menuData = Array<MenuData>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Audiobackground()
        self.view.backgroundColor = UIColor.whiteColor()
        var background = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        background.image = UIImage(named: "back.jpg")
        self.view.addSubview(background)
        self.title = "Paris Gateaux"

        //var backButton: UIBarButtonItem = UIBarButtonItem(title: "CUSTOM", style: UIBarButtonItemStyle.Bordered, target: self, action: nil)
        //self.navigationItem.rightBarButtonItem = backButton
        
        var birthdayData = MenuData(category: "birthday")

        birthdayData.addData("C01 Opera (Pháp)", price: "$12", imagePath: "birthday01.JPG",detail: "     Opera là loại gatô được coi như bảo vật quốc gia của Pháp. Từ hình thức nhiều tầng hấp dẫn đến đến khẩu vị tuyệt hảo tạo cho bản cảm giác như đang thưởng thức một vở nhạc kịch, vì vậy có tên là gatô Opera – tiếng Pháp có nghĩa là nhà hát lớn. Opera là sự kết hợp tuyệt vời giữa hương vị sôcôla Ganache của tầng trên và hương vị kem sữa cà phê hòa quyện với gatô hạnh nhân của tầng dưới tạo nên món điểm tâm sang trọng, là món không thể thiếu trong các buổi tiệc chiêu đãi khách quý của hoàng gia Pháp. Thành phần: Hạnh nhân, Sôcôla, Cà phê espresso,...")
        birthdayData.addData( "C02 Tiramisu (Ý)", price: "$15", imagePath: "birthday02.JPG",detail: "     Tiramisu là loại gato được coi như bảo vật quốc gia của Italia, với vị ngọt nhưng không sắc sẽ đem đến cho bạn cảm giác thú vị khó quên! Tiramisu theo tiếng Italia có nghĩa là “ Đưa em đi cùng”; Trong đại chiến thế giới thứ II, vợ yêu của một binh sĩ Italia đã dùng loại pho mát Mascarpone thượng hạng kết hợp với cà phê đặc và gatô ngón tay, tạo nên bánh tráng miệng cho chồng mang theo ra chiến trận, vì thế loại bánh này được đặt tên là Tiramisu, để người chồng luôn nhớ đến tình yêu của vợ mỗi khi ăn loại bánh này. Thành phần: Pho mát Mascarpone, Rượu Cà phê,...")
        birthdayData.addData("C03 Đại ngàn", price: "$20", imagePath: "birthday03.JPG",detail: "      Đại ngàn là loại gatô được coi như bảo vật quốc gia của Đức. Sở dĩ có tên gọi “ Đại ngàn – Black forest” là bởi bánh được làm từ quả anh đào đen, đặc sản của rừng sâu nước Đức, kết hợp với gatô sôcôla tạo thành một sản phẩm hoàn hảo. Với vị chua ngọt hấp dẫn, “ Đại ngàn” đã trở thành loại gatô có khẩu vị độc đáo và đạt tới sự thịnh hành rộng khắp trên toàn thế giới. Thành phần: Anh đào đen, Rượu anh đào, Cacao..")
        birthdayData.addData("C05 Caramel Pháp", price: "$25", imagePath: "birthday04.JPG",detail: "Thành phần: Cam, Sữa chua...")
        birthdayData.addData("C07 Thời đại hoàng kim", price: "$32", imagePath: "birthday05.JPG",detail: "Thành phần: Sốt caramel, Sốt cà phê , Sôcôla đen, Pudding,…")
        birthdayData.addData("C08 Nho dâu tây xanh", price: "$23", imagePath: "birthday06.JPG",detail: "Thành phần: Nho tươi, Dâu tây xanh, Sôcôla trắng, Pudding…")
        birthdayData.addData("C09 Ngọn lửa tình yêu", price: "$27", imagePath: "birthday07.JPG",detail:"Thành phần: Dâu tây, Sôcôla trắng, Kem tươi,...")
        birthdayData.addData("C10 Dâu tây pha lê", price: "$33", imagePath: "birthday08.JPG",detail: "Thành phần: Dâu tây, Sốt dâu tây, Thạch Pudding, Sôcôla…")
        birthdayData.addData("C12 Cà phê Ai-len", price: "$25", imagePath: "birthday09.JPG",detail: "Thành phần: Kem tươi cà phê, nhân sô cô la, thạch Pudding")
        birthdayData.addData("C24 Gấu Pooh (Táo)", price: "$17", imagePath: "birthday10.JPG",detail: "Thành phần: Táo tây, Pudding, Dừa, Kem tươi...")
        birthdayData.addData("C42 Nhím gai", price: "$21", imagePath: "birthday11.JPG",detail:"Thành phần: Dâu rừng nhập khẩu, Pudding, Kem tươi, Sôcôla...")
        menuData.append(birthdayData)
        
        
        var breadData = MenuData(category: "bread")
        
        breadData.addData("B01 Donut", price: "$12", imagePath: "bread01.JPG",detail: "")
        breadData.addData( "B03 Puoluo", price: "$15", imagePath: "bread02.JPG")
        breadData.addData("B41 Bánh Croissants (6 bánh)", price: "$20", imagePath: "bread03.JPG")
        breadData.addData("B42 Cà phê Đan Mạch", price: "$25", imagePath: "bread04.JPG")
        breadData.addData("B44 Dâu tây xanh Đan Mạch", price: "$32", imagePath: "bread05.JPG")
        breadData.addData("B46 Bánh Táo Đan Mạch", price: "$23", imagePath: "bread06.JPG")
        breadData.addData("B61 Vua Hokkaido", price: "$27", imagePath: "bread07.JPG")
        breadData.addData("B62 Bánh Cranberry", price: "$33", imagePath: "bread08.JPG")
        breadData.addData("B63 Bánh Sôcôla Thụy Sĩ", price: "$25", imagePath: "bread09.JPG")
        breadData.addData("B64 Mochi Cà phê", price: "$17", imagePath: "bread09.JPG")
        breadData.addData("C42 Nhím gai", price: "$21", imagePath: "bread10.JPG")
        menuData.append(breadData)

        var drinkData = MenuData(category: "drink")
        drinkData.addData("D01 Cà phê American", price: "$12", imagePath: "drink01.JPG")
        drinkData.addData( "D02 Espresso", price: "$15", imagePath: "drink02.JPG")
        drinkData.addData("D03 Cappuccino", price: "$20", imagePath: "drink03.JPG")
        drinkData.addData("D04 Cà phê Paris Gâteaux", price: "$25", imagePath: "drink04.JPG")
        drinkData.addData("D21 Hồng trà Srilanca", price: "$32", imagePath: "drink05.JPG")
        drinkData.addData("D22 Hồng trà Bá Tước", price: "$23", imagePath: "drink06.JPG")
        drinkData.addData("D23 Hồng trà đào", price: "$27", imagePath: "drink07.JPG")
        drinkData.addData("D24 Hồng trà kim quất", price: "$33", imagePath: "drink08.JPG")
        menuData.append(drinkData)
        
        var iceCreamData = MenuData(category: "iceCream")
        iceCreamData.addData("C91 Kem Vani", price: "$25", imagePath: "cream01.JPG")
        iceCreamData.addData( "C92 Kem sữa dừa", price: "$17", imagePath: "cream02.JPG")
        iceCreamData.addData("C93 Kem Rum nho", price: "$21", imagePath: "cream03.JPG")
        iceCreamData.addData("C94 Kem Caramel Hạnh nhân", price: "$21", imagePath: "cream04.JPG")
        iceCreamData.addData("D71 Kem tuyết Cappuccino", price: "$21", imagePath: "ice01.JPG")
        iceCreamData.addData("D72 Kem tuyết Mocha Chocolate", price: "$21", imagePath: "ice02.JPG")
        iceCreamData.addData("D73 Kem tuyết xoài", price: "$21", imagePath: "ice03.JPG")
        iceCreamData.addData("D74 Kem tuyết dâu tây", price: "$21", imagePath: "ice04.JPG")
        menuData.append(iceCreamData)
        
        var cookiesData = MenuData(category: "cookies")
        
        cookiesData.addData("G22 Hạt Điều Napoleon", price: "$25", imagePath: "cookies01.JPG")
        cookiesData.addData( "G23 Sôcôla Skate", price: "$17", imagePath: "cookies02.JPG")
        cookiesData.addData("G24 Hạnh nhân mật ong", price: "$21", imagePath: "cookies03.JPG")
        cookiesData.addData("G25 Sôcôla Chip", price: "$21", imagePath: "cookies04.JPG")
        cookiesData.addData("G26 Cookie Cà phê", price: "$21", imagePath: "cookies05.JPG")
        cookiesData.addData("G27 Cookie Ngũ cốc", price: "$21", imagePath: "cookies06.JPG")
        cookiesData.addData("G51 Feng Li Nguyên vị (Dứa)", price: "$21", imagePath: "cookies07.JPG")
        cookiesData.addData("G52 Feng Li Cà phê (Dứa)", price: "$21", imagePath: "cookies08.JPG")
        menuData.append(cookiesData)

        
        
        
        
        //birthday
        var button1 = UIButton()
        button1 = UIButton(frame: CGRectMake(20, 30, 60, 60))
        var imageb1 = UIImage(named: "birthdayCake.png") as UIImage!
        button1.setBackgroundImage(imageb1, forState: .Normal)
        button1.addTarget(self, action: "touchBirthday", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button1)
        
        
        var labelb1: UILabel = UILabel()
        labelb1 = UILabel(frame: CGRect(x: 25, y: 50, width: 100, height: 100))
        labelb1.text = NSString(UTF8String: "Birthday")
        labelb1.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb1.font = UIFont(name:labelb1.font.fontName, size: 12)
        self.view.addSubview(labelb1)
        //bread
        var button2 = UIButton()
        button2 = UIButton(frame: CGRectMake(125, 30, 60, 60))
        var imageb2 = UIImage(named: "muffin.png") as UIImage!
        button2.setBackgroundImage(imageb2, forState: .Normal)
        button2.addTarget(self, action: "touchBread", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button2)
        
        var labelb2: UILabel = UILabel()
        labelb2 = UILabel(frame: CGRect(x: 140, y: 50, width: 100, height: 100))
        labelb2.text = NSString(UTF8String: "Bread")
        labelb2.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb2.font = UIFont(name: labelb2.font.fontName, size: 12)
        self.view.addSubview(labelb2)
        
        //Drink
        var button3 = UIButton()
        button3 = UIButton(frame: CGRectMake(235, 30, 60, 60))
        var imageb3 = UIImage(named: "coffee-cup.png") as UIImage!
        button3.setBackgroundImage(imageb3, forState: .Normal)
        button3.addTarget(self, action: "touchDrink", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button3)
        
        var labelb3: UILabel = UILabel()
        labelb3 = UILabel(frame: CGRect(x: 255, y: 50, width: 100, height: 100))
        labelb3.text = NSString(UTF8String: "Drink")
        labelb3.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb3.font = UIFont(name: labelb3.font.fontName, size: 12)
        self.view.addSubview(labelb3)
        
        //Ice Cream
        var button4 = UIButton()
        button4 = UIButton(frame: CGRectMake(20, 130, 60, 60))
        var imageb4 = UIImage(named: "iceCream.png") as UIImage!
        button4.setBackgroundImage(imageb4, forState: .Normal)
        button4.addTarget(self, action: "touchIceCream", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button4)
        
        var labelb4: UILabel = UILabel()
        labelb4 = UILabel(frame: CGRect(x: 25, y: 150, width: 100, height: 100))
        labelb4.text = NSString(UTF8String: "IceCream")
        labelb4.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb4.font = UIFont(name: labelb4.font.fontName, size: 12)
        self.view.addSubview(labelb4)
        //COOKIES
        var button5 = UIButton()
        button5 = UIButton(frame: CGRectMake(125, 130, 60, 60))
        var imageb5 = UIImage(named: "cookies.png") as UIImage!
        button5.setBackgroundImage(imageb5, forState: .Normal)
        button5.addTarget(self, action: "touchCookies", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button5)
        
        var labelb5: UILabel = UILabel()
        labelb5 = UILabel(frame: CGRect(x: 130, y: 150, width: 100, height: 100))
        labelb5.text = NSString(UTF8String: "Cookies")
        labelb5.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        labelb5.font = UIFont(name: labelb5.font.fontName, size: 12)
        self.view.addSubview(labelb5)
        
        //ParisGateuax
        var imagePa = UIImageView(frame: CGRect(x: 25, y: 250, width: self.view.bounds.size.width - 50, height: 130))
        imagePa.image = UIImage(named: "ParisGateuax.png")
        self.view.addSubview(imagePa)
        
//         func preferredStatusBarStyle() -> UIStatusBarStyle {
//            return UIStatusBarStyle.LightContent
        
        
//    }
    
    }
    func Audiobackground() {
        var alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("background", ofType: ".mp3")!)
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        var error: NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: alertSound, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
    func touchBirthday() {
        var birthdayView = DetailScreen()
        birthdayView.setData(menuData[0])
        self.navigationController?.pushViewController(birthdayView, animated: true)
    }
    
    func touchBread() {
        var birthdayView = DetailScreen()
        birthdayView.setData(menuData[1])
        self.navigationController?.pushViewController(birthdayView, animated: true)    }
    
    func touchDrink() {
        var drinkView = DetailScreen()
        drinkView.setData(menuData[2])
        self.navigationController?.pushViewController(drinkView, animated: true)
    }
    
    func touchIceCream() {
        var icecreamView =  DetailScreen()
        icecreamView.setData(menuData[3])
        self.navigationController?.pushViewController(icecreamView, animated: true)
    }
    
    func touchCookies() {
        var cookiesView = DetailScreen()
        cookiesView.setData(menuData[4])
        self.navigationController?.pushViewController(cookiesView, animated: true)
    }
    
    //    func onTap() {touchIceCream
    //        let storyBoard = UIStoryboard(name: "Parisgateuax", bundle: nil)
    //        let helloWorldVC: AnyObject! = storyBoard.instantiateInitialViewController()
    //        self.presentViewController(helloWorldVC as UIViewController, animated: true) { () -> Void in
    //        }
    //    }
    
    
    
}
