//
//  SearchGitViewCell.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 01.11.2020.
//

import UIKit

class SearchGitViewCell: UITableViewCell {
    
    private let baseView = BaseView()
    private let stackView = UIStackView()
    private let activityIndicator = UIActivityIndicatorView()
    
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
        
            activityIndicator.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
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
    
    func configure(for model: Item) {
        
        loginLabel.text = model.login
        typeLabel.text = model.type
        
        DispatchQueue.global().async { [weak self] in
            
            guard let url = model.avatarUrl,
                  let imageURL = URL(string: url),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self?.photo.image = UIImage(data: imageData)
                self?.isElements(hide: false)
            }
            
        }
    }
}

    // MARK: - Help Functions

private extension SearchGitViewCell {
    
    private func setup() {
        
        selectionStyle = .none
        
        setupStackView()
        setupActivityIndicator()
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
    
    private func setupActivityIndicator() {
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.appColor(.title)
        
        isElements(hide: true)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(activityIndicator)
    }
    
    private func setupPhoto() {
        
        photo.image = UIImage(named: Constants.namedImages.defaultImage)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(photo)
    }
    
    private func setupLoginName() {
        
        loginLabel.numberOfLines = 1
        loginLabel.textAlignment = .left
        loginLabel.font = .systemFont(ofSize: 15)
        loginLabel.textColor = UIColor.appColor(.title)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(loginLabel)
    }
    
    private func setupTypeLabel() {
        
        typeLabel.numberOfLines = 1
        typeLabel.textAlignment = .left
        typeLabel.font = .systemFont(ofSize: 15)
        typeLabel.textColor = UIColor.appColor(.title)
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(typeLabel)
    }
    
    private func setupLine() {
        
        line.alpha = 0.5
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(line)
    }
}

    // MARK: - HELP INDICATOR FUNCTIONS

private extension SearchGitViewCell {
    
    private func isElements(hide: Bool) {
        
        if hide {
            activityIndicator.startAnimating()
            
            line.isHidden = true
            photo.isHidden = true
            loginLabel.isHidden = true
            typeLabel.isHidden = true
        } else {
            activityIndicator.stopAnimating()
            
            line.isHidden = false
            photo.isHidden = false
            loginLabel.isHidden = false
            typeLabel.isHidden = false
        }
    }
}
