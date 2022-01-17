//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alena Vasenina on 04.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Profile"
        navigationItem.backButtonTitle = "Back"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: [Post] = Post.testPosts
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        return tableView
    }()
    
    lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints(){
        
        tableView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func handleTapGesture (gesture: UITapGestureRecognizer) {
        print("tap location: \(gesture.location(in: self.view)), state: \(gesture.state.rawValue)")
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model.count + 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            cell.onTapSeeMore = { [weak self] in self?.showPhotoGallery() }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.post = model[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.avatarImageView.addGestureRecognizer(gesture)
        header.avatarImageView.isUserInteractionEnabled = true
        return header
    }
    func tableView(_: UITableView, estimatedHeightForHeaderInSection: Int) -> CGFloat {
        170
    }
    
    private func showPhotoGallery() {
        let photoVC = PhotosViewController()
        navigationController!.pushViewController(photoVC, animated: true)
    }
}

