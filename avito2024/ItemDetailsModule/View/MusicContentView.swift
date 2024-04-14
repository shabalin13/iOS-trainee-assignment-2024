//
//  MusicContentView.swift
//  avito2024
//
//  Created by DIMbI4 on 13.04.2024.
//

import UIKit

class MusicContentView: UIView {
    
    // MARK: - Properties
    weak var delegate: ContentViewDelegate?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return imageView
    }()
    
    private lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var authorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(authorButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 11, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private lazy var trackViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.addTarget(self, action: #selector(trackViewButtonTapped), for: .touchUpInside)
        button.setTitle("mediaButtonTitle".localize, for: .normal)
        return button
    }()
    
    private lazy var bottomInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    private func setupView() {
        backgroundColor = .systemBackground
        
        addSubview(imageView)
        addSubview(trackNameLabel)
        addSubview(authorButton)
        addSubview(genreLabel)
        addSubview(trackViewButton)
        addSubview(bottomInfoLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        trackNameLabel.translatesAutoresizingMaskIntoConstraints = false
        authorButton.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        trackViewButton.translatesAutoresizingMaskIntoConstraints = false
        bottomInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            trackNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            trackNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            trackNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            authorButton.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor),
            authorButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            authorButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            genreLabel.topAnchor.constraint(equalTo: authorButton.bottomAnchor, constant: 2),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            trackViewButton.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 30),
            trackViewButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bottomInfoLabel.topAnchor.constraint(greaterThanOrEqualTo: trackViewButton.bottomAnchor, constant: 30),
            bottomInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            bottomInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            bottomInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
        ])
    }
    
    // MARK: - Configuration
    func configure(itemDetails: DisplayedMusicItemDetails) {
        if let imageData = itemDetails.imageData {
            imageView.image = UIImage(data: imageData)
        }
        trackNameLabel.text = itemDetails.trackNameLabelText
        authorButton.setTitle(itemDetails.authorButtonText, for: .normal)
        if let genreLabelText = itemDetails.genreLabelText {
            genreLabel.isHidden = false
            genreLabel.text = genreLabelText
        } else {
            genreLabel.isHidden = false
        }
        trackViewButton.isHidden = !itemDetails.isShowTrackViewButton
        bottomInfoLabel.text = itemDetails.bottomInfoLabelText
    }
    
    // MARK: - objc methods
    @objc private func authorButtonTapped() {
        print("authorButtonTapped")
        delegate?.authorButtonTapped()
    }
    
    @objc private func trackViewButtonTapped() {
        print("trackViewButtonTapped")
        delegate?.mediaViewButtonTapped()
    }
    
}

