//
//  StoriesItemCell.swift
//  Instagram
//
//  Created by Julia on 14.04.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible
        circleImageViev.isHidden = !info.isNewStory
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imageToCellInset: CGFloat = 6
        static let labelToCellInset: CGFloat = 6
        static let imageToLabelOffset: CGFloat = 6
        static let usernameFontSize: CGFloat = 12
        static let plusButtonSize: CGFloat = 20
        static let circleSize: CGFloat = 72
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2
        view.clipsToBounds = true
        return view
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameFontSize)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusButton"), for: .normal)
        return button
    }()
    
    private let circleImageViev: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "storyCircle")
        return view
    }()
    
}

private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imageToCellInset)
        }
        contentView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCellInset)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabelOffset)
        }
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView)
            make.size.equalTo(UIConstants.plusButtonSize)
        }
        contentView.addSubview(circleImageViev)
        circleImageViev.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.circleSize)
        }
        
    }
}
