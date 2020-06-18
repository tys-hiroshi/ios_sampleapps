//
//  RatingControl.swift
//  ios_sampleapp
//
//  Created by macmini on 2020/06/18.
//  Copyright © 2020 hblockth. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
     
    var rating = 0
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
     
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        
        for _ in 0..<5 {
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }

}
