//
//  BootLogic.swift
//  TechmasterSwiftApp
//  Techmaster Vietnam

import UIKit


struct Menu {
    var title : colorBar
    var viewClass: String
};

struct MenuSection {
    var section: String
    var menus: [Menu]
}

class BootLogic: NSObject {
    
    var menu : [MenuSection]!
    class func boot(window:UIWindow){
        
        
//        var dictData = NSDictionary()
//        var arrData = NSArray()
//        var path: String = ""
//        
//        path = Bundle.main.path(forResource:"colorData", ofType: "plist")!
//        dictData = NSDictionary(contentsOfFile: path)!
//        arrData = dictData["data"] as! NSArray
//        
//        
//        let mainScreen = MainScreen(style: UITableViewStyle.grouped)
//        mainScreen.menu = []
//        
//        for index in 0..<arrData.count {
//            let itemDict = arrData[index] as! NSDictionary
//            
//            let item = itemDict["data"] as! NSArray
//            let name = itemDict["name"] as! String
//            
//            let basic = MenuSection(section: String(name), menus:[
//                Menu(title: colorBar.init(frame: CGRect(x: 0,
//                                                        y: 0,
//                                                        width: UIScreen.main.bounds.width,
//                                                        height: UIScreen.main.bounds.height),
//                                          color_0: item[0] as! String,
//                                          color_1: item[1] as! String,
//                                          color_2: item[2] as! String,
//                                          color_3: item[3] as! String,
//                                          color_4: item[4] as! String),
//                     viewClass: "ScreenA")
//                
//                ])
//            
//            
//            mainScreen.menu.append(basic)
//        }
        
        
        
        
        
        let nav = UINavigationController(rootViewController: AppScreenViewController())
        
        window.rootViewController = nav        
        
    }   
}
