//
//  RepoInfoCell.swift
//  GitSearch
//
//  Created by Eugene Kiselev on 06.11.2020.
//

import UIKit

class RepoInfoCell: UITableViewCell {
    private let stackView = UIStackView()
    
    var tapButton: ((UITableViewCell) -> ())?
    
    private let nameRepo = UILabel()
    private let languageProject = UILabel()
    private let stars = UIImageView()
    private let starsCount = UILabel()
    private let updateLabel = UILabel()
    private let button = UIButton()
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
        
            nameRepo.topAnchor.constraint(equalTo: stackView.topAnchor, constant: constant / 2),
            nameRepo.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant / 2),
            nameRepo.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant / 2),
        ])
        
        NSLayoutConstraint.activate([
        
            languageProject.topAnchor.constraint(equalTo: nameRepo.bottomAnchor, constant: constant / 2 ),
            languageProject.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant / 2),
            languageProject.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant / 2)
        ])
        
        NSLayoutConstraint.activate([
        
            stars.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -constant / 2),
            stars.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant / 2),
            stars.heightAnchor.constraint(equalToConstant: frame.height / 4),
            stars.widthAnchor.constraint(equalToConstant: frame.height / 4)
        ])
        
        NSLayoutConstraint.activate([
        
            starsCount.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -constant / 2 ),
            starsCount.leadingAnchor.constraint(equalTo: stars.trailingAnchor, constant: constant / 2),
            starsCount.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant / 2)
        ])
        
        NSLayoutConstraint.activate([
        
            updateLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -constant / 2 ),
            updateLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: constant / 2),
            updateLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -constant / 2)
        ])
        
        NSLayoutConstraint.activate([
        
            button.topAnchor.constraint(equalTo: stackView.topAnchor),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: frame.height / 2),
            button.widthAnchor.constraint(equalToConstant: frame.height / 2)
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

private extension RepoInfoCell {
    
    private func setup() {
        
        setupStackView()
        setupButton()
        setupNameRepoLabel()
        setupLanguageProjectLabel()
        setupStars()
        setupStarsCount()
        setupUpdateLabel()
        setupLine()
    }
    
    private func setupStackView() {
        
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
    }
    
    private func setupNameRepoLabel() {
        
        nameRepo.text = "Name Repo"
        nameRepo.numberOfLines = 1
        nameRepo.textAlignment = .left
        nameRepo.font = .systemFont(ofSize: 13)
        nameRepo.textColor = .black
        
        nameRepo.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(nameRepo)
    }
    
    private func setupLanguageProjectLabel() {
        
        languageProject.text = "Swift"
        languageProject.numberOfLines = 1
        languageProject.textAlignment = .left
        languageProject.font = .systemFont(ofSize: 12)
        languageProject.textColor = .gray
        
        languageProject.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(languageProject)
    }
    
    private func setupStars() {
        
        stars.isHidden = true
        
        stars.image = UIImage(systemName: Constants.namedImages.star)
        stars.tintColor = .black
        
        stars.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(stars)
    }
    
    private func setupStarsCount() {
        
        starsCount.isHidden = true
        
        starsCount.text = "0"
        starsCount.numberOfLines = 1
        starsCount.textAlignment = .left
        starsCount.font = .systemFont(ofSize: 13)
        starsCount.textColor = .black
        
        starsCount.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(starsCount)
    }
    
    private func setupUpdateLabel() {
        
        updateLabel.isHidden = true
        
        updateLabel.text = "00.00.00 00.00"
        updateLabel.numberOfLines = 1
        updateLabel.textAlignment = .right
        updateLabel.font = .systemFont(ofSize: 13)
        updateLabel.textColor = .black
        
        updateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(updateLabel)
    }
    
    private func setupButton() {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: Constants.namedImages.arrowDown), for: .normal)
        button.tintColor = .black
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        contentView.addSubview(button)
    }
    
    private func setupLine() {
        
        line.alpha = 0.5
        
        line.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addSubview(line)
    }
}

    // MARK: - Actions

private extension RepoInfoCell {
    
    @objc private func tapped() {
        
        tapButton?(self)
        
        updateLabel.isHidden.toggle()
        stars.isHidden.toggle()
        starsCount.isHidden.toggle()
    }
}

