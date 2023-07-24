//
//  ViewController.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 20/07/2023.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var dataforSection1 : [Model]?
    var dataForSection2 : [Model]?
    var viewModel : MainViewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupTable()
        dataforSection1 = []
        dataForSection2 = []
        dataforSection1?.append(Model(image: "person", name: "Personal Data"))
        dataforSection1?.append(Model(image: "icons8-setting-24", name: "Settings"))
        dataforSection1?.append(Model(image: "icons8-purchase-order-48", name: "E-Statement"))
        dataforSection1?.append(Model(image: "icons8-heart-24", name: "Reafferal Code"))
        
        dataForSection2?.append(Model(image: "message", name: "FAQs"))
        dataForSection2?.append(Model(image: "icons8-pencil-25", name: "Our Handbook"))
        dataForSection2?.append(Model(image: "icons8-community-30", name: "Community"))
    }
    
    func setupView(){
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setData(){
        
    }
    
    func setupTable(){
        tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        tableView.register(headerTable.self, forHeaderFooterViewReuseIdentifier: "TableViewHeader")
        tableView.register(footerTable.self, forHeaderFooterViewReuseIdentifier: "footerTable")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        if #available(iOS 11.0, *) {
                tableView.contentInsetAdjustmentBehavior = .never
            } else {
                automaticallyAdjustsScrollViewInsets = false
            }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return section == 0 ? 4 : 3
        viewModel.numberOfRows(inSection: section)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
       viewModel.cellForRowAt(indexPath: indexPath, cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 130
        }
        else {
            return 30
        }
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader") as? headerTable
            header?.backgroundColor = .brown
            header?.labelName.text = "William John Malik"
            header?.image.image = UIImage(named: "profike")
            header?.labelJob.text = "Aggressive Investor"
            return header
        } else{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader") as? headerTable
            return header
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else {
            return 120
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            return nil
        } else{
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footerTable") as? footerTable
            header?.backgroundColor = .brown
            header?.image.image = UIImage(named: "headphone")
            header?.labelContent.text = "Feel Free to Ask, We Ready to Help"
            return header
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let informationViewController = InformationViewController()
            informationViewController.modalTransitionStyle = .flipHorizontal
            informationViewController.modalPresentationStyle = .fullScreen
                   // Hiển thị InformationViewController dưới dạng modal.
            self.present(informationViewController, animated: true, completion: nil)
            }
        }
    }
    


