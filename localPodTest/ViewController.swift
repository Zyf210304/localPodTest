//
//  ViewController.swift
//  localPodTest
//
//  Created by mac on 2024/10/26.
//

import UIKit
import YFlibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        btn.addTarget(self, action: #selector(showToast), for: .touchUpInside)
        btn.backgroundColor = .red
        view.addSubview(btn)
    }

    @objc func showToast() {
        SuperToast.show(title: "hahahahhh")
    }

}

