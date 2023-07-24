//
//  TextFieldView.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 22/07/2023.
//

import UIKit

class TextFieldView: UIView {

    lazy var nameField : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 123/255, green: 136/255, blue: 149/255, alpha: 1)
        return label
    }()
    
    lazy var textField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 229/255, green: 228/255, blue: 232/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 15
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 252/255, alpha: 1)
        textField.allowsEditingTextAttributes = true
        textField.isUserInteractionEnabled = true
        textField.isEnabled = true
        textField.textColor = UIColor(red: 41/255, green: 59/255, blue: 87/255, alpha: 1)
        textField.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return textField
    }()
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        view.axis = .horizontal
        view.spacing = 20
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(nameField)
        nameField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameField.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        addSubview(textField)
        textField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    

}
