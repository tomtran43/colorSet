//
//  ScreenB.swift
//  BootStrapDemo
//
//  Created by Techmaster on 9/6/16.
//  Copyright © 2016 Techmaster Vietnam. All rights reserved.
//

import UIKit

class ScreenB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = (event?.allTouches?.first)!
        let location = touch.location(in: self.view)
        let pickedColor = self.view.getPixelColorAtPoint(point: location, sourceView: self.view)
        
        print(pickedColor)
    }
    
}
