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
    
    lazy private var width: CGFloat = {
        return view.frame.width/2 - 40
    }()
    
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
            let btn = UIButton(primaryAction: nil)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.widthAnchor.constraint(equalToConstant: 31).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 31).isActive = true
            btn.layer.cornerRadius = 16
            
            let gradient = viewServise.gradientLayer(startColor: UIColor(hex: "#B2A1F733FF"), frame: CGRect(x: 0, y: 0, width: 31, height: 31))
            btn.layer.addSublayer(gradient)
            
            btn.clipsToBounds = true
            
            let btnImage: UIImageView = {
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
    
    func createCards(){
        let tiktokCard = createLongCardContect(
            for: viewServise.createCardView(gradientColor: "#58CFEFFF", width: width),
            image: .tiktok,
            title: "TikTok\nads",
            rate: 4.9,
            views: 1234)
        
        view.addSubview(tiktokCard)
        
        tiktokCard.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 33).isActive = true
        tiktokCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
    }
    func createLongCardContect(for item: UIView, image: UIImage, title: String, rate: Float, views: Int) -> UIView {
        let cardImage = viewServise.createCardImage(image: image)
        let cardTitle = viewServise.createCardTitle(title: title)
        let rateStack = viewServise.createRateStack(reate: rate)
        let viewsStack = viewServise.getViewLabel(views: views)
        
        lazy var topStack = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 12
            stack.addArrangedSubview(cardImage)
            stack.addArrangedSubview(cardTitle)
            
            return stack
        }()
        
        lazy var bottomStack = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 2
            stack.addArrangedSubview(rateStack)
            stack.addArrangedSubview(viewsStack)
            
            return stack
            
        }()
        
        let mainStack = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .leading
            stack.spacing = 21
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(topStack)
            stack.addArrangedSubview(bottomStack)
            
            
            return stack
        }()
        
        item.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: item.topAnchor, constant: 25),
            mainStack.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 25),
            mainStack.trailingAnchor.constraint(equalTo: item.trailingAnchor, constant: -25),
            mainStack.bottomAnchor.constraint(equalTo: item.bottomAnchor, constant: -25),
        ])
        
        return item
        
    }
    
    func createShortCardContent(){
        
    }
}
