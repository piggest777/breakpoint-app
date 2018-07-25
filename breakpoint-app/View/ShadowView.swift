//
//  ShadowView.swift
//  breakpoint-app
//
//  Created by Denis Rakitin on 2018-07-25.
//  Copyright © 2018 Denis Rakitin. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        super.awakeFromNib()
    }


}
