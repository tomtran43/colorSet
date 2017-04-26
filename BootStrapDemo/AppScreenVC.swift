//
//  AppScreenViewController.swift
//  BootStrapDemo
//
//  Created by Loc Tran on 4/26/17.
//  Copyright © 2017 Techmaster Vietnam. All rights reserved.
//

import UIKit

class AppScreenVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var mainImageView: UIImageView!
    var baseImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        addColorListButton()
        addAlbumButton()
        addCameraButton()
        addImageView()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addImageView(){
        mainImageView = UIImageView(frame: CGRect(x: 0, y: 300, width: 300, height: 300))
        
        mainImageView.backgroundColor = UIColor.cyan
        self.view.addSubview(mainImageView)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage:UIImage = (info[UIImagePickerControllerOriginalImage]) as? UIImage
        {
//            baseImage = pickedImage
//            mainImageView.image = baseImage
            
            let image = PassImage.sharedInstance
            image.image = pickedImage
        }
        
        let pickImageVC = PickedImageVC()
        
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.pushViewController(pickImageVC, animated: true)

    }
    
    func addAlbumButton(){
        let button = UIButton(frame: CGRect(x: self.view.bounds.size.width*2/3, y: 100, width: 50, height: 50))
        
        button.backgroundColor = UIColor.blue
        
        button.addTarget(self, action: #selector(loadAlbum), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func addCameraButton(){
        let button = UIButton(frame: CGRect(x: self.view.bounds.size.width*2/3, y: 200, width: 50, height: 50))
        
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            var imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func loadAlbum(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            var imagePicker = UIImagePickerController()

            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        }
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
        
        let mainScreen = TableViewVC(style: UITableViewStyle.grouped)
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
                     viewClass: "DetailColorVC")
                
                ])
            
            
            mainScreen.menu.append(basic)
        }
        
        mainScreen.title = "Color Set"
        mainScreen.about = "Gesture Recognizer iOS8"
        
        self.navigationController?.pushViewController(mainScreen, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let image = PassImage.sharedInstance
        image.image = baseImage
        
    }
    
}

