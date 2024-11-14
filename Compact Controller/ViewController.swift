//
//  ViewController.swift
//  Compact Controller
//
//  Created by aeroclub on 13.11.2024.
//

import UIKit

class ViewController: UIViewController {

    private lazy var openButton:  UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(openController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupOpenButton()
    }
    
    private func setupOpenButton() {
        view.addSubview(openButton)
        
        openButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
    }
    
    @objc private func openController() {
        let controller = CustomController()
        controller.modalPresentationStyle = .popover

        if let popover = controller.popoverPresentationController {
            popover.delegate = self
            popover.sourceView = openButton
            popover.sourceRect = openButton.bounds
            popover.permittedArrowDirections = .up
        }

        present(controller, animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none 
    }
}

