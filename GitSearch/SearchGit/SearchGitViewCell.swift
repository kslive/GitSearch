//
//  SearchGitViewCell.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewCell: UITableViewCell {
    
    private let stackView = UIStackView()
    
    private let line = LineView()
    private let photo = UIImageView()
    private let loginLabel = UILabel()
    private let typeLabel = UILabel()
    
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
        
            photo.topAnchor.constraint(equalTo: stackView.topAnchor, constant: constant / 2),
            photo.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant / 2),
            photo.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            photo.heightAnchor.constraint(equalToConstant: frame.height - constant),
            photo.widthAnchor.constraint(equalToConstant: frame.height - constant)
        ])
        
        NSLayoutConstraint.activate([
        
            loginLabel.topAnchor.constraint(equalTo: photo.topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: constant),
            loginLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant)
        ])
        
        NSLayoutConstraint.activate([
        
            typeLabel.bottomAnchor.constraint(equalTo: photo.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: constant),
            typeLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant)
        ])
        
        NSLayoutConstraint.activate([
        
            line.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -constant / 10),
            line.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            line.widthAnchor.constraint(equalToConstant: frame.width - constant),
            line.heightAnchor.constraint(equalToConstant: constant / 10)
        ])
    }
}

    // MARK: - Help Functions

private extension SearchGitViewCell {
    
    private func setup() {
        
        selectionStyle = .none
        
        setupStackView()
        setupPhoto()
        setupLoginName()
        setupTypeLabel()
        setupLine()
    }
    
    private func setupStackView() {
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
    }
    
    private func setupPhoto() {
        
        photo.image = UIImage(named: Constants.namedImages.defaultImage)
        photo.layer.cornerRadius = frame.height / 2
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(photo)
    }
    
    private func setupLoginName() {
        
        loginLabel.text = "Login Name"
        loginLabel.numberOfLines = 1
        loginLabel.textAlignment = .left
        loginLabel.font = .systemFont(ofSize: 15)
        loginLabel.textColor = .black
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(loginLabel)
    }
    
    private func setupTypeLabel() {
        
        typeLabel.text = "User"
        typeLabel.numberOfLines = 1
        typeLabel.textAlignment = .left
        typeLabel.font = .systemFont(ofSize: 15)
        typeLabel.textColor = .gray
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(typeLabel)
    }
    
    private func setupLine() {
        
        line.alpha = 0.5
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(line)
    }
}
