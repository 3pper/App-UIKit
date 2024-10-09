//
//  ViewController.swift
//  App
//
//  Created by Egor on 08.10.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var viewManager: ViewManager = {
        return ViewManager(controller: self, view: view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#464C75FF")
        viewManager.createAppHeader(title: "Lorem ipsum \nDuis aute irure dolor")
    }


}

