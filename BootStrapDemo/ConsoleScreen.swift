
//
//  ConsoleScreen.swift
//  TechmasterSwiftApp
//


import UIKit

class ConsoleScreen: UIViewController {
    weak var console:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let console = UITextView(frame: self.view.bounds)
        console.backgroundColor = UIColor.black
        console.textColor = UIColor.green
        console.font = UIFont(name: "Courier", size: 16)
        console.isEditable = false
        self.view.addSubview(console)
        self.console = console
    }
    
    func write(string: String){
        let temp: NSString = self.console.text as NSString
        self.console.text = temp.appending(string)
    }
    func writeln (string: String){
        let temp = self.console.text
        self.console.text = temp?.appendingFormat("%@%@", string, "\n")
    }
}
