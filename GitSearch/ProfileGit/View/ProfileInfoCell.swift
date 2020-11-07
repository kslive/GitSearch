//
//  ProfileInfoCell.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 06.11.2020.
//

import UIKit

class ProfileInfoCell: UITableViewCell {
    
    private let stackView = UIStackView()
    
    private let nameLabel = UILabel()
    private let loginLabel = UILabel()
    private let photo = UIImageView()
    private var dateJoined = UILabel()
    private let locationLabel = UILabel()
    private let line = LineView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor),
        ])
        
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: constant),
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant),
            nameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant)
        ])
        
        NSLayoutConstraint.activate([
        
            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: constant / 2),
            loginLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant),
            loginLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant)
        ])
        
        NSLayoutConstraint.activate([
        
            photo.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: constant / 2),
            photo.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            photo.heightAnchor.constraint(equalToConstant: frame.height / 2),
            photo.widthAnchor.constraint(equalToConstant: frame.height / 2)
        ])
        
        NSLayoutConstraint.activate([
        
            dateJoined.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -constant),
            dateJoined.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant),
            dateJoined.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant)
        ])
        
        NSLayoutConstraint.activate([
        
            locationLabel.bottomAnchor.constraint(equalTo: dateJoined.topAnchor, constant: -constant),
            locationLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant),
            locationLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant)
        ])
        
        NSLayoutConstraint.activate([
        
            line.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -constant / 10),
            line.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            line.widthAnchor.constraint(equalToConstant: frame.width - constant),
            line.heightAnchor.constraint(equalToConstant: constant / 10)
        ])
    }
    
    func configure(for model: Repositories?) {
        
        self.loginLabel.text = model?.login ?? ""
        self.nameLabel.text = model?.name ?? ""
        self.dateJoined.text = model?.createdAt ?? ""
        self.locationLabel.text = model?.location ?? ""
        
        DispatchQueue.global().async { [weak self] in
            
            guard let url = model?.avatarUrl,
                  let imageURL = URL(string: url),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self?.photo.image = UIImage(data: imageData)
            }
        }
    }
}

    // MARK: - Help Functions

private extension ProfileInfoCell {
    
    private func setup() {
        
        selectionStyle = .none
        
        setupStackView()
        setupNameLabel()
        setupLoginName()
        setupPhoto()
        setupDateJoined()
        setupLocationLabel()
        setupLine()
    }
    
    private func setupStackView() {
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
    }
    
    private func setupNameLabel() {
        
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 17)
        nameLabel.textColor = .black
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(nameLabel)
    }
    
    private func setupLoginName() {
        
        loginLabel.numberOfLines = 1
        loginLabel.textAlignment = .center
        loginLabel.font = .systemFont(ofSize: 15)
        loginLabel.textColor = .gray
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(loginLabel)
    }
    
    private func setupPhoto() {
        
        photo.image = UIImage(named: Constants.namedImages.defaultImage)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(photo)
    }
    
    private func setupDateJoined() {
        
        dateJoined.numberOfLines = 1
        dateJoined.textAlignment = .center
        dateJoined.font = .systemFont(ofSize: 15)
        dateJoined.textColor = .gray
        
        dateJoined.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(dateJoined)
    }
    
    private func setupLocationLabel() {
        
        locationLabel.numberOfLines = 1
        locationLabel.textAlignment = .center
        locationLabel.font = .systemFont(ofSize: 15)
        locationLabel.textColor = .gray
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(locationLabel)
    }
    
    private func setupLine() {
        
        line.alpha = 0.5
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(line)
    }
}
