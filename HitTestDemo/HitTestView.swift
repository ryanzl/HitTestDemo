//
//  HitTestView.swift
//  HitTestDemo
//
//  Created by ChinaTeam on 16/7/8.
//  Copyright © 2016年 ryanzl. All rights reserved.
//

import Foundation
import UIKit
class HitTestView: UIView {
    var label: UILabel?
    var btn: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = self.viewWithTag(1) as! UILabel
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.userInteractionEnabled = true
        for item in self.subviews {
            if let tmp = item as? UILabel {
                label = tmp
                break
            }
        }
        if let tmpLabel = label {
            if tmpLabel.text == "view1" {
                let tapGes = UITapGestureRecognizer(target: self, action: #selector(HitTestView.resTapGes(_:)))
                self.addGestureRecognizer(tapGes)
                
                btn = UIButton(type: .System)
                btn?.setTitle("view1 btn", forState: .Normal)
                btn?.frame = CGRectMake(100, 5, 100, 30)
                self.addSubview(btn!)
                
                
            }
        }
        
    }
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {

        print("\(label!.text!)----->")
        
        let view = super.hitTest(point, withEvent: event)
        
        if let hitView = view as? HitTestView  {
            print("\(label!.text!) return view----->\(hitView.label!.text!)")
        }else{
            print("\(label!.text!) return view----->\(view != nil ? (view!) : view)")
        }
        
        
        return view
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        print("touch begin--->\(label!.text!)--->event:\(event.)")
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        print("touch end--->\(label!.text)")
    }
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        print("action:\(action)")
        return true
    }
    //MARK:Ges
    func resTapGes(ges: UITapGestureRecognizer) {
        if let resView = ges.view as? HitTestView {
            print("\(resView.label!.text!) as responder tap ges")
        }else {
            print("responder tap ges")
        }
    }
    
}