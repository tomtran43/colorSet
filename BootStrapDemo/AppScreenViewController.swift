//
//  AppScreenViewController.swift
//  BootStrapDemo
//
//  Created by Loc Tran on 4/26/17.
//  Copyright © 2017 Techmaster Vietnam. All rights reserved.
//

import UIKit

class AppScreenViewController: UIViewController {
    
    var baseImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        addColorListButton()
        addAlbumButton()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addAlbumButton(){
        let button = UIButton(frame: CGRect(x: self.view.bounds.size.width*2/3, y: 100, width: 50, height: 50))
        
        button.backgroundColor = UIColor.blue
        
        button.addTarget(self, action: #selector(loadAlbum), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func loadAlbum(){
        

    }
    
    
    
    func addColorListButton(){
        let button = UIButton(frame: CGRect(x: self.view.bounds.size.width/2, y: 100, width: 50, height: 50))
        button.backgroundColor = UIColor.black
        
        button.addTarget(self, action: #selector(pushToTableView), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    func pushToTableView(){
        
        var dictData = NSDictionary()
        var arrData = NSArray()
        var path: String = ""
        
        path = Bundle.main.path(forResource:"colorData", ofType: "plist")!
        dictData = NSDictionary(contentsOfFile: path)!
        arrData = dictData["data"] as! NSArray
        
        
        let mainScreen = MainScreen(style: UITableViewStyle.grouped)
        mainScreen.menu = []
        
        for index in 0..<arrData.count {
            let itemDict = arrData[index] as! NSDictionary
            
            let item = itemDict["data"] as! NSArray
            let name = itemDict["name"] as! String
            
            let basic = MenuSection(section: String(name), menus:[
                Menu(title: colorBar.init(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.height),
                                          color_0: item[0] as! String,
                                          color_1: item[1] as! String,
                                          color_2: item[2] as! String,
                                          color_3: item[3] as! String,
                                          color_4: item[4] as! String),
                     viewClass: "ScreenA")
                
                ])
            
            
            mainScreen.menu.append(basic)
        }
        
        mainScreen.title = "Gesture Recognizer"
        mainScreen.about = "Gesture Recognizer iOS8"
        
        self.navigationController?.pushViewController(mainScreen, animated: true)
    }
    
}

extension AppScreenViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func thisIsTheFunctionWeAreCalling() {
        let camera = DSCameraHandler(delegate_: self)
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        optionMenu.popoverPresentationController?.sourceView = self.view
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { (alert : UIAlertAction!) in
            camera.getCameraOn(self, canEdit: true)
        }
        let sharePhoto = UIAlertAction(title: "Photo Library", style: .default) { (alert : UIAlertAction!) in
            camera.getPhotoLibraryOn(self, canEdit: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert : UIAlertAction!) in
        }
        optionMenu.addAction(takePhoto)
        optionMenu.addAction(sharePhoto)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // image is our desired image
        
        picker.dismiss(animated: true, completion: nil)
    }
}
