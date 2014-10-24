////
////  Attachments + Collision.swift
////  DynamicsKitDemo
////
////  Created by mhtran on 10/22/14.
////  Copyright (c) 2014 vn.Techmsater. All rights reserved.
////
//
//import UIKit
//import QuartzCore
//
//class Attachments___Collision: UIViewController {
//    var square,background : UIImageView!
//    var attachPoint: UIImageView!
//    var dragPoint: UIImageView!
//    var attachmentDecorationLayers: NSMutableArray!
//    var attachmentPointView:UIView!
//    var attachedView:UIView!
//    var attachmentOffset:CGPoint!
//    var animator: UIDynamicAnimator?
//    let collision = UICollisionBehavior()
//    var attachmentBehavior: UIAttachmentBehavior?
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//    }
//    
//    override func layoutSubviews(){
//        
//        super.layoutSubviews()
//        if (self.arrowView != nil ) {
//            self.arrowView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
//        }
//        
//        
//        if(self.attachmentDecorationLayers != nil){
//            // Here we adjust the line dash pattern visualizing the attachment
//            // between attachmentPoint and attachedView to account for a change
//            // in the position of either
//            
//            var maxDashes = self.attachmentDecorationLayers.count
//            
//            var attachmentPointViewCenter = CGPointMake(self.attachmentPointView.bounds.size.width/2, self.attachmentPointView.bounds.size.height/2)
//            attachmentPointViewCenter = self.attachmentPointView.convertPoint(attachmentPointViewCenter, toView: self)
//            
//            var attachedViewAttachmentPoint = CGPointMake(self.attachedView.bounds.size.width/2 + self.attachmentOffset.x, self.attachedView.bounds.size.height/2 + self.attachmentOffset.y)
//            attachedViewAttachmentPoint = self.attachedView.convertPoint(attachedViewAttachmentPoint, toView: self)
//            
//            
//            
//            var distance:CGFloat = CGFloat(sqrt(powf(Float(attachedViewAttachmentPoint.x) - Float(attachmentPointViewCenter.x), 2.0) + powf(Float(attachedViewAttachmentPoint.y) - Float(attachmentPointViewCenter.y), 2.0)))
//            
//            
//            var angle:CGFloat = atan2(CGFloat( attachedViewAttachmentPoint.y - attachmentPointViewCenter.y), CGFloat(attachedViewAttachmentPoint.x - attachmentPointViewCenter.x))
//            
//            var requiredDashes = 0
//            var d:CGFloat = 0.0
//            
//            // Depending on the distance betweeen the two views, a smaller number of
//            // dashes may be needed to adequately visualize the attachment. Starting with the distance of 0, we add the length of each dash ulti we exceed "distance" computed previosly or we use the maximum number of allowed dashes
//            
//            while ( requiredDashes < maxDashes){
//                
//                var dashLayer:CALayer =  self.attachmentDecorationLayers[requiredDashes] as CALayer
//                if(d + CGFloat(dashLayer.bounds.size.height) < distance){
//                    d += dashLayer.bounds.size.height
//                    dashLayer.hidden = false
//                    requiredDashes++
//                    
//                }else {
//                    break
//                }
//            }
//            
//            // Based on the total length of the dashes we previously determined were
//            // necessary to visualize the attachment, determine the spacing between each dash
//            var a:CGFloat = distance - d
//            var b:CGFloat = CGFloat(requiredDashes + 1)
//            
//            var dashSpacing:CGFloat = a / b
//            
//            // Hide the excess dashes
//            for i in requiredDashes..<maxDashes {
//                (self.attachmentDecorationLayers[i] as CALayer).hidden = true
//            }
//            
//            //Disable any animations. The changes must take full effect immediately
//            CATransaction.begin()
//            CATransaction.setAnimationDuration(0)
//            
//            // Each dash layer is positioned by altering its affineTransform.
//            // We combine the position of rotation into an affine transformation matrix that
//            // is assigned to each dash
//            
//            
//            var transform:CGAffineTransform = CGAffineTransformMakeTranslation(attachmentPointViewCenter.x, attachmentPointViewCenter.y)
//            transform = CGAffineTransformRotate(transform, angle - CGFloat(M_PI/2))
//            
//            for (var drawnDashes = 0; drawnDashes < requiredDashes; drawnDashes++){
//                var dashLayer = self.attachmentDecorationLayers[drawnDashes] as CALayer
//                
//                transform = CGAffineTransformTranslate(transform, 0, dashSpacing)
//                dashLayer.setAffineTransform(transform)
//                transform = CGAffineTransformTranslate(transform, 0, dashLayer.bounds.size.height)
//            }
//            CATransaction.commit()
//        }
//    }
//    deinit{
//        if(self.attachmentPointView != nil){
//            self.attachmentPointView.removeObserver(self, forKeyPath: "center")
//        }
//        if(self.attachedView != nil){
//            self.attachedView.removeObserver(self, forKeyPath: "center")
//        }
//        
//    }
//
//    override func loadView() {
//        super.loadView()
//        self.edgesForExtendedLayout = UIRectEdge.None
//        var size = self.view.bounds.size
//        background = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//        background?.image = UIImage(named: "image#2.png")
//        self.view.addSubview(background!)
//        square = UIImageView(frame: CGRect(x: size.width * 0.5 - 40 , y: 40 + 50, width: 80, height: 80))
//        square?.image = UIImage(named: "image#3.png")
//        self.view.addSubview(square!)
//        attachPoint = UIImageView(frame: CGRect(x: square!.center.x - 30, y: square!.center.y - 30, width: 10, height: 10))
//        attachPoint.image = UIImage(named: "image#1.png")
//        self.view.addSubview(attachPoint!)
//        dragPoint = UIImageView(frame: CGRect(x: size.width * 0.5 - 5, y: 30, width: 10, height: 10))
//        dragPoint.image = UIImage(named: "image#1.png")
//        self.view.addSubview(dragPoint!)
//        animator = UIDynamicAnimator(referenceView: self.view)
//        collision.translatesReferenceBoundsIntoBoundary = true
//        animator!.addBehavior(collision)
//        configureAttachment()
//    }
//    func configureAttachment() {
//        let squareSize = square?.bounds.size
//        let offset = UIOffset(horizontal: attachPoint.center.x - squareSize!.width * 0.5, vertical: attachPoint.center.y - squareSize!.height * 0.5)
//        dragPoint.tintColor = UIColor.redColor()
//        dragPoint.image = dragPoint?.image?.imageWithRenderingMode( UIImageRenderingMode.AlwaysTemplate)
//        attachmentBehavior = UIAttachmentBehavior(item: square!, offsetFromCenter: offset, attachedToAnchor: dragPoint.center)
//        animator!.addBehavior(attachmentBehavior)
//        attachPoint.tintColor = UIColor.blueColor()
//        attachPoint.image = attachPoint?.image?.imageWithRenderingMode( UIImageRenderingMode.AlwaysTemplate)
//        dragPoint.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "onMoveDragPoint:"))
//        
//    }
//    
//  
//    func onMoveDragPoint(sender: UIPanGestureRecognizer) {
//        attachmentBehavior!.anchorPoint = sender.locationInView(self.view)
//        dragPoint.center = attachmentBehavior!.anchorPoint
//    }
//    
//    func trackAndDrawAttachmentFromView(attachmentPointView:UIImageView, attachedView:UIImageView, attachmentOffset:CGPoint){
//        var attachmentDecorationLayers: NSMutableArray!
//        if(self.attachmentDecorationLayers == nil) {
//            //First time initialization
//            self.attachmentDecorationLayers = NSMutableArray(capacity: 4)
//            for i in 0..<4 {
//                var imageName = "DashStyle\((i%3)+1)"
//                
//                var dashImage = UIImage(named: imageName)  //Tạo ra 3 ảnh dash line
//                var dashLayer = CALayer()
//                dashLayer.contents = dashImage!.CGImage
//                dashLayer.bounds = CGRectMake(0, 0, dashImage!.size.width, dashImage!.size.height)
//                dashLayer.anchorPoint = CGPointMake(0.5, 0)
//                
//                //self.layer.insertSublayer(dashLayer, atIndex: 0)
//                self.layer.addSublayer(dashLayer)
//                self.attachmentDecorationLayers.addObject(dashLayer)
//            }
//        }
//}
