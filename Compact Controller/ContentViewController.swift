//
//  ContentViewController.swift
//  Compact Controller
//
//  Created by aeroclub on 13.11.2024.
//

import UIKit

class CustomController: UIViewController, UIPopoverPresentationControllerDelegate {

    private lazy var heightSegmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["280pt", "150pt"])
        
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        return segment
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        
        button.addTarget(self, action: #selector(closeController), for: .touchUpInside)
        
        return button
    }()
    
    private var currentHeight: CGFloat = 280

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        setup()
      
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.preferredContentSize = CGSize(width: 300, height: 280)
    }

    private func setup() {
        view.addSubview(heightSegmentedControl)
        view.addSubview(closeButton)
        
        heightSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            heightSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc private func segmentChanged() {
        switch heightSegmentedControl.selectedSegmentIndex {
        case 0:
            updateHeight(to: 280)
        case 1:
            updateHeight(to: 150)
        default:
            break
        }
    }

    private func updateHeight(to height: CGFloat) {
       
        UIView.animate(withDuration: 0.3) {
            self.preferredContentSize = CGSize(width: 300, height: height)
            self.view.layoutIfNeeded()
        }
    }

    @objc private func closeController() {
        dismiss(animated: true, completion: nil)
    }
}
