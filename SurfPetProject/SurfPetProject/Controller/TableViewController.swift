//
//  TestViewController.swift
//  SurfPetProject
//
//  Created by Илья Морин on 14.02.2023.
//

import UIKit


class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let commentLabel = UILabel()
    
    var commentView = UIView()
    
    func setupCommentView() -> UIView {
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        view.addSubview(commentView)
        commentView.pinTop(to:
                            self.view.safeAreaLayoutGuide.centerYAnchor)
        commentView.pin(to: self.view, [.left: 16, .right: 24])
        commentLabel.font = .systemFont(ofSize: 24.0,
                                        weight: .medium)
        commentLabel.textColor = .black
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .left
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.top: 16, .left:
                                            16, .bottom: 400, .right: 16])
        commentLabel.text = "Стажировка в Surf"
        return commentView
    }
    
    
    var showTableViewButton = UIButton()
    
    private func setupShowTableViewButton() {
        showTableViewButton.setTitle("Отправить заявку", for: .normal)
        showTableViewButton.setTitleColor(.systemBackground, for: .normal)
        showTableViewButton.layer.cornerRadius = 30
        showTableViewButton.titleLabel?.font = .systemFont(ofSize:
            16.0, weight: .light)
        showTableViewButton.backgroundColor = .buttonCustomBlack()
        showTableViewButton.layer.shadowColor = UIColor.black.cgColor
        showTableViewButton.layer.shadowOffset = CGSize(width: 1, height:2)
        showTableViewButton.layer.shadowRadius = 5
        showTableViewButton.layer.shadowOpacity = 0.25
        self.view.addSubview(showTableViewButton)
        showTableViewButton.setHeight(60)
        showTableViewButton.pinBottom(to: self.view.bottomAnchor)
        showTableViewButton.pin(to: self.view, [.left: 150, .right: 16])
        showTableViewButton.addTarget(self, action:
                                    #selector(showTablePressed), for: .touchUpInside)
    }
    
    
    @IBAction func showTablePressed() {
        let dialogMessage = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let close = UIAlertAction(title: "Закрыть", style: .default, handler: { (action) -> Void in
            print("Close button tapped")
        })
        dialogMessage.addAction(close)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
     
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            
            viewModels: [
                TileCollectionViewCellViewModel(name: "IOS", bacgroundColor: .buttonCustomGray()),
                TileCollectionViewCellViewModel(name: "Android", bacgroundColor: .buttonCustomGray()),
                TileCollectionViewCellViewModel(name: "Kotlin", bacgroundColor: .buttonCustomGray()),
                TileCollectionViewCellViewModel(name: "Flutter", bacgroundColor: .buttonCustomGray()),
                TileCollectionViewCellViewModel(name: "Java", bacgroundColor: .buttonCustomGray()),
                TileCollectionViewCellViewModel(name: "C++", bacgroundColor: .buttonCustomGray())
                ])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCommentView()
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        setupShowTableViewButton()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell =  tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
                for: indexPath)
                as? CollectionTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/10
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.setHeight(50)
        tableView.pin(to: self.view, [.left: 16, .top: 50, .right: 16, .bottom: 16])
        
    }
}


