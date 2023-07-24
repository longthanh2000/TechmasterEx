//
//  headerFooterView.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 20/07/2023.
//

import UIKit

class headerTable: UITableViewHeaderFooterView {
    static let identifier = "TableViewHeader"
     lazy var image : UIImageView = {
         let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
     lazy var labelName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 40/255, green: 62/255, blue: 88/255, alpha: 1)
         label.font = UIFont.systemFont(ofSize: 20)
         label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
     lazy var labelJob : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = UIColor(red: 40/255, green: 62/255, blue: 88/255, alpha: 1)
         label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    lazy var seperateLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        return view
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(image)
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        self.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        
        stackView.addArrangedSubview(labelName)
        stackView.addArrangedSubview(labelJob)
        
        self.addSubview(seperateLine)
        seperateLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        seperateLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        seperateLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25).isActive = true
        seperateLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    
    
}



class footerTable: UITableViewHeaderFooterView {
    static let identifier = "footerTable"
     lazy var image : UIImageView = {
         let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var viewConainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = UIColor(red: 238, green: 239, blue: 253, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(red: 238/255, green: 239/255, blue: 253/255, alpha: 1)
        return view
    }()
    
     lazy var labelContent : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         label.textColor = UIColor.systemPurple
         label.font = UIFont.systemFont(ofSize: 13, weight: .heavy)
         label.textColor = UIColor(red: 123/255, green: 137/255, blue: 216/255, alpha: 1)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = .red
        self.addSubview(viewConainer)
        viewConainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        viewConainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        viewConainer.heightAnchor.constraint(equalToConstant: 90).isActive = true
        viewConainer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.addSubview(image)
       
        viewConainer.addSubview(image)
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
       
        viewConainer.addSubview(labelContent)
        labelContent.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelContent.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        
       
    }
    
    
    
}
