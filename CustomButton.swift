//
//  CustomButton.swift
//  PlatypusMVP
//
//  Created by John McCants on 2/29/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//
import UIKit

class CustomButton: UIButton {
    
    var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).CGPath
            shadowLayer.fillColor = UIColor.whiteColor().CGColor
            
            shadowLayer.shadowColor = UIColor.darkGrayColor().CGColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 2
            
            layer.insertSublayer(shadowLayer, atIndex: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }        
    }
    
}
