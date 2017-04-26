//
//  PickedImageVC.swift
//  BootStrapDemo
//
//  Created by Loc Tran on 4/26/17.
//  Copyright © 2017 Techmaster Vietnam. All rights reserved.
//

import UIKit

class PickedImageVC: UIViewController {

    
//    var mainImageView: UIImageView!
//    var baseImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let image = PassImage.sharedInstance
        var baseImage = image.image
        
        var mainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        mainImageView.image = baseImage
        self.view.addSubview(mainImageView)
        
//        addImageView()
    }

//    func addImageView(){
//        mainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
//        mainImageView.image = baseImage
//        self.view.addSubview(mainImageView)
//        
//    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let image = PassImage.sharedInstance
//        baseImage = image.image
//    }


}
