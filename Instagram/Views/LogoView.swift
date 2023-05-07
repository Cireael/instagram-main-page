//
//  LogoView.swift
//  Instagram
//
//  Created by Julia on 10.04.2023.
//

import SnapKit
import UIKit

class LogoView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum UIConstants {
        static let logoWidth: CGFloat = 104
        static let logoHight: CGFloat = 30
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "instagram")
        return view
    }()
}

private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(UIConstants.logoWidth)
            make.height.equalTo(UIConstants.logoHight)
        }
    }
}
