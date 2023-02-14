//
//  ViewController.swift
//  SurfPetProject
//
//  Created by Илья Морин on 13.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        assignbackground()
        setupShowTableViewButton()
    }
    var showTableViewButton = UIButton()
    
    private func setupShowTableViewButton() {
        showTableViewButton.setTitle("Start", for: .normal)
        showTableViewButton.setTitleColor(.black, for: .normal)
        showTableViewButton.layer.cornerRadius = 12
        showTableViewButton.titleLabel?.font = .systemFont(ofSize:
            16.0, weight: .medium)
        showTableViewButton.backgroundColor = .white
        showTableViewButton.layer.shadowColor = UIColor.black.cgColor
        showTableViewButton.layer.shadowOffset = CGSize(width: 5, height:5)
        showTableViewButton.layer.shadowRadius = 5
        showTableViewButton.layer.shadowOpacity = 0.25
        self.view.addSubview(showTableViewButton)
        showTableViewButton.setHeight(48)
        showTableViewButton.pinTop(to: self.view.centerYAnchor)
        showTableViewButton.pin(to: self.view, [.left: 24, .right:
                                                24])
        showTableViewButton.addTarget(self, action:
                                    #selector(showTablePressed), for: .touchUpInside)
    }

    func assignbackground(){
            let background = UIImage(named: "surf.png")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func showTablePressed() {
        let tableVC = TableViewController()
        if let sheet = tableVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
            
        }
        present(tableVC, animated: true)
        
    }
}


// MARK: - SwiftUI
import SwiftUI

struct VCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = ViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<VCProvider.ContainerView>) -> ViewController{
            return viewController
        }
        
        func updateUIViewController(_ uiViewController:
            VCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<VCProvider.ContainerView>) {
        }
    }
}


