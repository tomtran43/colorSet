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
        
        
        let nav = UINavigationController(rootViewController: AppScreenVC())
        
        window.rootViewController = nav
        
    }
}
