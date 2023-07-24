//
//  checkBoxButton.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 23/07/2023.
//

import UIKit

class checkBoxButton: UIButton {

    // Images for the checkbox button states
        let checkedImage = UIImage(named: "check")
        let uncheckedImage = UIImage(named: "unchecke")

        // Boolean property to track the checkbox state
        var isChecked: Bool = false {
            didSet {
                updateButtonImage()
            }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupButton()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupButton()
        }

        private func setupButton() {
            // Set the default state to unchecked
            isChecked = false
            
            // Add target action to handle button taps
            addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
            
            // Update the button image based on the initial state
            updateButtonImage()
        }

        private func updateButtonImage() {
            // Set the button image based on the isChecked state
            let image = isChecked ? checkedImage : uncheckedImage
            setImage(image, for: .normal)
        }

        @objc private func checkboxTapped() {
            // Toggle the checkbox state on button tap
            isChecked = !isChecked
        }
    func setTitle(_ title: String) {
        setTitle(title)
    }
}
