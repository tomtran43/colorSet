//
//  PassImage.swift
//  BootStrapDemo
//
//  Created by Loc Tran on 4/26/17.
//  Copyright © 2017 Techmaster Vietnam. All rights reserved.
//

import Foundation
import UIKit

class PassImage {
    static let sharedInstance = PassImage()
    private init(){}
    
    var image: UIImage!
    init(image: UIImage) {
        self.image = image
    }
}
