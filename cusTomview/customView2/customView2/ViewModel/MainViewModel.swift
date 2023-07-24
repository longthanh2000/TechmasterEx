//
//  MainViewModel.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 23/07/2023.
//

import Foundation
import UIKit

class MainViewModel {
    var dataforSection1 : [Model]?
        var dataForSection2 : [Model]?

        init() {
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
    
    func numberOfRows(inSection section: Int) -> Int {
        return section == 0 ? 4 : 3
    }
//    
    func cellForRowAt(indexPath: IndexPath, cell: MenuTableViewCell) {
        cell.containImage.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        if indexPath.section == 0 {
            cell.nameOfFeature.text = dataforSection1?[indexPath.row].name
            cell.img.image = UIImage(named: dataforSection1?[indexPath.row].image ?? "")
        } else {
            cell.nameOfFeature.text = dataForSection2?[indexPath.row].name
            cell.img.image = UIImage(named: dataForSection2?[indexPath.row].image ?? "")
        }
    }
//
    func heightForHeaderInSection(section: Int) -> CGFloat {
        return section == 0 ? 130 : 30
    }
//    
//    func viewForHeaderInSection(section: Int) -> UIView? {
//        if section == 0 {
//            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader") as? headerTable
//            header?.backgroundColor = .brown
//            header?.labelName.text = "William John Malik"
//            header?.image.image = UIImage(named: "profike")
//            header?.labelJob.text = "Aggressive Investor"
//            return header
//        } else {
//            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewHeader") as? headerTable
//            return header
//        }
//    }
//    
//    func heightForFooterInSection(section: Int) -> CGFloat {
//        return section == 0 ? 0 : 120
//    }
//    
//    func viewForFooterInSection(section: Int) -> UIView? {
//        if section == 0 {
//            return nil
//        } else {
//            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footerTable") as? footerTable
//            header?.backgroundColor = .brown
//            header?.image.image = UIImage(named: "headphone")
//            header?.labelContent.text = "Feel Free to Ask, We Ready to Help"
//            return header
//        }
//    }
//    
//    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
//
    func didSelectRowAt(indexPath: IndexPath, viewController: UIViewController) {
        if indexPath.row == 0 {
            let informationViewController = InformationViewController()
            // Hiển thị InformationViewController dưới dạng modal.
            viewController.present(informationViewController, animated: true, completion: nil)
        }
    }
}

