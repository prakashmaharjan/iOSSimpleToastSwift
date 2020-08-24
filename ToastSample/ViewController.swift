//
//  ViewController.swift
//  ToastSample
//
//  Created by prakash Maharjan on 8/24/20.
//  Copyright © 2020 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -- IB Outlests
    @IBOutlet weak var showToastButton: UIButton!
    
    // MARK: -- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpUI()
        
    }
    
    // MARK: -- SetUp Button
    func setUpUI(){
        self.showToastButton.layer.borderColor = UIColor.lightGray.cgColor
        self.showToastButton.layer.borderWidth = 0.5
        self.showToastButton.layer.cornerRadius = self.showToastButton.frame.height / 2.0
        self.showToastButton.backgroundColor = UIColor.orange
        self.showToastButton.setTitleColor(UIColor.white, for: .normal)
        self.showToastButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    
    // MARK: -- Show Toast Button Action
    @IBAction func showToast(_ sender: Any) {
        showToastWithMessage(message: "This is a simple toast.", duration: 1.0)
    }
}


// MARK: -- ViewController Extensiion
extension ViewController{
    
    // MARK: -- Show Toast Message
    func showToastWithMessage(message : String, duration: Double){
        
        let toastLabel = UILabel(frame: CGRect(x: 30, y: 0, width: self.view.frame.size.width - 60, height: 40))
        toastLabel.center.y = self.view.frame.size.height - 70
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        toastLabel.textColor = .white
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 8
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 2
        toastLabel.text = message
        self.view.addSubview(toastLabel)
        
        
        UIView.animate(withDuration: duration, delay: 1.0, options: .curveEaseInOut, animations: {
            toastLabel.alpha = 0.0
        }) { (iscompleted) in
            toastLabel.removeFromSuperview()
        }
        
    }
}

