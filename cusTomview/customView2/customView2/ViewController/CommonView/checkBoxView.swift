//
//  checkBoxView.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 23/07/2023.
//

import UIKit

class checkBoxView: UIView {
//
//    var containerView : UIView = {
//       let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.borderWidth = 1
//        view.layer.backgroundColor = UIColor.black.cgColor
//        return view
//    }()
    
    lazy var checkBoxButton : checkBoxButton = {
        var button = customView2.checkBoxButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 232/255, alpha: 1).cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var genderLb : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Male"
        label.textColor = UIColor(red: 41/255, green: 59/255, blue: 87/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
       
       layer.borderWidth = 1
        layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 232/255, alpha: 1).cgColor
        layer.cornerRadius = 15
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 252/255, alpha: 1)
        addSubview(checkBoxButton)
           
           checkBoxButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
           checkBoxButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
           checkBoxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        checkBoxButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkBoxButton.layer.cornerRadius = 10
        addSubview(genderLb)
        genderLb.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        genderLb.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 10).isActive = true
    }
    

}
