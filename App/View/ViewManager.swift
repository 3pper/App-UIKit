//
//  ViewManager.swift
//  App
//
//  Created by Egor on 08.10.2024.
//

import UIKit

class ViewManager {
    
    var controller: UIViewController
    var view: UIView
    private let viewServise = ViewService.shared
    private var headerStack = UIStackView()
    
    init(controller: UIViewController, view: UIView) {
        self.controller = controller
        self.view = view
    }
    
    func createAppHeader(title: String) {
        headerStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        var headerLabel: UILabel {
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
            label.numberOfLines = 0
            return label
        }
        
        let headerBtn = {
            let btn = UIButton(primaryAction: UIAction(handler: { _ in
                print(1)
            }))
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.widthAnchor.constraint(equalToConstant: 31).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 31).isActive = true
            btn.layer.cornerRadius = 16
            
            let gradient = viewServise.gradientLayer(startColor: UIColor(hex: "#B2A1F733FF"), frame: CGRect(x: 0, y: 0, width: 31, height: 31))
            btn.layer.addSublayer(gradient)
            
            btn.clipsToBounds = true
            
            var btnImage: UIImageView = {
                let img = UIImageView()
                img.image = UIImage(systemName: "magnifyingglass")
                img.translatesAutoresizingMaskIntoConstraints = false
                img.widthAnchor.constraint(equalToConstant: 18).isActive = true
                img.heightAnchor.constraint(equalToConstant: 18).isActive = true
                img.tintColor = .white


                return img
            }()
            btn.addSubview(btnImage)
            
            btnImage.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
            btnImage.centerYAnchor.constraint(equalTo: btn.centerYAnchor).isActive = true
            
            return btn
        }()
        

        
        headerStack.addArrangedSubview(headerLabel)
        headerStack.addArrangedSubview(headerBtn)
        
        view.addSubview(headerStack)
        
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            headerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        ])
        
    }
}
