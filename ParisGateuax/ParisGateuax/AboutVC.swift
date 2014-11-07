//
//  AboutVC.swift
//  ParisGateuax
//
//  Created by mhtran on 11/3/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class AboutVC: UIViewController, UIScrollViewDelegate {

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    var textView: UITextView!
//    let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
    var autoscroolTimer: NSTimer?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor(red: 179/255, green: 99/255, blue: 114/255, alpha: 1)
            self.navigationController!.setNavigationBarHidden(true, animated: true)
            
//            self.scrollView.backgroundColor = UIColor(red: 179/255, green: 99/255, blue: 114/255, alpha: 1)
//            self.view = self.scrollView
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            if (autoscroolTimer == nil) {
                autoscroolTimer = NSTimer.scheduledTimerWithTimeInterval(60.0/1000.0, target: self, selector: "autoscrollTimeFired", userInfo: nil, repeats: true)
            }
            textView = UITextView(frame : CGRect(x:10, y:90, width:(screenWidth-20), height: (screenHeight-220) ))
            textView.backgroundColor = UIColor(red: 179/255, green: 99/255, blue: 114/255, alpha: 1)
            textView.text = "Nhà hàng bánh ngọt Paris Gâteaux thuộc công ty liên doanh Grand Union Việt Nam khai trương ngày 2 tháng 10 vừa qua hứa hẹn trở thành một điểm  đến lý thú cho những ai yêu thích văn hóa ẩm thực Pháp. \n     Đến với Paris Gâteaux thực khách không chỉ được thưởng thức các món bánh với hương vị Pháp tuyệt hảo mà còn được tận mắt chứng kiến không gian thưởng thức mang đậm phong cách của nước Pháp hoa lệ và trang nhã. \n     Paris gâteaux nổi bật với lối kiến trúc sang trọng, trang nhã trên tông màu trắng. Bên trong là những chiếc bàn, ghế sofa êm ái với gam màu chủ đạo là xanh cốm và nâu sôcôla mang đến cho thực khách một cảm giác ấm áp, thân quen mà không kém phần tinh tế.  \n     Paris Gâteaux có đủ chủng loại bánh Gato, bánh mì, bánh bỏ lò, pizza, café, fastfood… do các chuyên gia đến từ Đài Loan đảm nhiệm chế biến.  \n      Paris Gâteaux có 3 tầng. Tầng 1 là nơi bán và trưng bày sản phẩm. Tầng 2 và 3 của Paris Gâteaux là nơi để sản xuất.  \n    Bánh tại Paris Gâteaux được làm từ các nguyên liệu ngoại nhập và sản xuất trên dây truyền hiện đại, đảm bảo các tiêu chuẩn về vệ sinh và an toàn thực phẩm."
//            self.textView
            //textView.userInteractionEnabled = true
            self.view.addSubview(textView!)

    }
    
    func autoscrollTimeFired() {
        var scrollPoint: CGPoint = self.textView.contentOffset
        scrollPoint = CGPointMake(scrollPoint.x, scrollPoint.y + 1)
        self.textView.setContentOffset(scrollPoint, animated: false)
    }

}
