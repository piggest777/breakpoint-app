//
//  CirecleProfileImage.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-08-10.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit


@IBDesignable class CircularImageView: UIImageView {
    
    override var image: UIImage? {
        didSet {
            super.image = image?.circularImage(size: nil)
        }
    }
    
}

extension UIImage {
    
    func circularImage(size size: CGSize?) -> UIImage {
        let newSize = size ?? self.size
        
        let minEdge = min(newSize.height, newSize.width)
        let size = CGSize(width: minEdge, height: minEdge)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        
        self.draw(in: CGRect(origin: CGPoint.zero, size: size), blendMode: .copy, alpha: 1.0)
        
        context!.setBlendMode(.copy)
        context!.setFillColor(UIColor.clear.cgColor)
        
        let rectPath = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: size))
        let circlePath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: size))
        rectPath.append(circlePath)
        rectPath.usesEvenOddFillRule = true
        rectPath.fill()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result!
    }
    
}

