//
//  InformationViewController.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 22/07/2023.
//

import UIKit

class InformationViewController: UIViewController {
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        return view
    }()
    lazy var avatar : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.image = UIImage(named: "profike")
        image.backgroundColor = .red
        image.contentMode = .scaleToFill
        return image
    }()
    lazy var cameraImg : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.image = UIImage(named: "icons8-camera-50")
        return image
    }()
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var nameView : TextFieldView = {
        let view = TextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameField.text = "Your Name"
        return view
    }()
    
    lazy var dateOfBirthView : TextFieldView = {
        let view = TextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameField.text = "Date of birth"
        return view
    }()
    
    lazy var jobView : TextFieldView = {
        let view = TextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameField.text = "Your Job"
        return view
    }()
    
    lazy var incomeView : TextFieldView = {
        let view = TextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.nameField.text = "Monthly Income"
        return view
    }()
    lazy var textField : UITextField = {
       let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    lazy var genderLabel : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gender"
        return label
    }()
    
    lazy var checkboxViewMale : checkBoxView = {
        var button = checkBoxView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var checkboxViewFeMale : checkBoxView = {
        var button = checkBoxView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.genderLb.text = "Female"
        return button
    }()
    
    lazy var buttonSubmit : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Xong", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 238/255, green: 239/255, blue: 253/255, alpha: 1)
        button.setTitleColor(UIColor(red: 123/255, green: 137/255, blue: 216/255, alpha: 1), for: .normal)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    func setupView(){
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(avatar)
        avatar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        avatar.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.addSubview(cameraImg)
        cameraImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cameraImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        cameraImg.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -21).isActive = true
        cameraImg.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: -21).isActive = true
        
        
        scrollView.addSubview(nameView)
        nameView.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20).isActive = true
        nameView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        nameView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.addSubview(dateOfBirthView)
        dateOfBirthView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        dateOfBirthView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        dateOfBirthView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dateOfBirthView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(jobView)
        jobView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        jobView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        jobView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        jobView.topAnchor.constraint(equalTo: dateOfBirthView.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(incomeView)
        incomeView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        incomeView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        incomeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        incomeView.topAnchor.constraint(equalTo: jobView.bottomAnchor, constant: 10).isActive = true
        
        scrollView.addSubview(genderLabel)
        genderLabel.topAnchor.constraint(equalTo: incomeView.bottomAnchor, constant: 20).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10).isActive = true
       
        stackView.addArrangedSubview(checkboxViewMale)
        stackView.addArrangedSubview(checkboxViewFeMale)
       
        view.addSubview(buttonSubmit)
        buttonSubmit.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        buttonSubmit.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        buttonSubmit.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        buttonSubmit.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    @objc func buttonTapped(){
        self.dismiss(animated: true)
    }

}


