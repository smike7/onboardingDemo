//
//  ProfileVC.swift
//  onboardngDemo
//
//  Created by Faisal on 06/12/2022.
//

import UIKit
import SnapKit

final class ProfileVC: UIViewController {
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    
    private lazy var headerImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "bgProfile"))
        img.contentMode = .scaleToFill
        return img
    }()
    
    private lazy var profileImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "image1"))
        img.layer.cornerRadius = 75
        img.layer.cornerCurve = .circular
        img.clipsToBounds = true
        img.layer.borderWidth = 9
        img.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        img.contentMode = .scaleToFill
        return img
    }()
    private lazy var userNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular), compatibleWith: .current)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.text = "@FaisalAlotaibi"
        return lbl
    }()
    private lazy var bioLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 36, weight: .bold), compatibleWith: .current)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.text = "This is SnapKit demo Project"
        return lbl
    }()
    
    private lazy var loremLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 13, weight: .regular), compatibleWith: .current)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet porttitor lacus luctus accumsan tortor posuere. Maecenas ultricies mi eget mauris pharetra et ultrices neque. Amet volutpat consequat mauris nunc congue nisi. Suspendisse potenti nullam ac tortor. Egestas dui id ornare arcu odio ut sem. Elit duis tristique sollicitudin nibh sit amet commodo nulla. Pellentesque id nibh tortor id aliquet. Sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Ut venenatis tellus in metus vulputate eu. Eros in cursus turpis massa tincidunt dui. Lacinia quis vel eros donec ac odio tempor orci. Tincidunt lobortis feugiat vivamus at.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet porttitor lacus luctus accumsan tortor posuere. Maecenas ultricies mi eget mauris pharetra et ultrices neque. Amet volutpat consequat mauris nunc congue nisi. Suspendisse potenti nullam ac tortor. Egestas dui id ornare arcu odio ut sem. Elit duis tristique sollicitudin nibh sit amet commodo nulla. Pellentesque id nibh tortor id aliquet. Sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Ut venenatis tellus in metus vulputate eu. Eros in cursus turpis massa tincidunt dui. Lacinia quis vel eros donec ac odio tempor orci. Tincidunt lobortis feugiat vivamus at.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet porttitor lacus luctus accumsan tortor posuere. Maecenas ultricies mi eget mauris pharetra et ultrices neque. Amet volutpat consequat mauris nunc congue nisi. Suspendisse potenti nullam ac tortor. Egestas dui id ornare arcu odio ut sem. Elit duis tristique sollicitudin nibh sit amet commodo nulla. Pellentesque id nibh tortor id aliquet. Sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Ut venenatis tellus in metus vulputate eu. Eros in cursus turpis massa tincidunt dui. Lacinia quis vel eros donec ac odio tempor orci. Tincidunt lobortis feugiat vivamus at."
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        setupLayout()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = firstVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    
}

extension ProfileVC {
    private func setupLayout() {
        scrollView = UIScrollView()
        contentView = UIView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        contentView.isUserInteractionEnabled = true
        contentView.addSubview(headerImage)
        headerImage.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.top.equalTo(contentView)
                .offset(40)
            make.left.equalTo(view)
                .offset(20)
            make.right.equalTo(view)
                .offset(-20)
        }
        
        contentView.addSubview(profileImage)
        
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(headerImage.snp.bottom)
                .offset(-75)
            make.width.height.equalTo(150)
            make.centerX.equalTo(view)
        }
        
        contentView.addSubview(userNameLbl)
        
        userNameLbl.snp.makeConstraints { make in
            make.top.equalTo(headerImage.snp.bottom)
                .offset(75)
            make.left.equalTo(view)
                .offset(20)
            make.right.equalTo(view)
                .offset(-20)
        }
        contentView.addSubview(bioLbl)
        
        bioLbl.snp.makeConstraints { make in
            make.top.equalTo(userNameLbl.snp.bottom)
                .offset(10)
            make.left.equalTo(view)
                .offset(20)
            make.right.equalTo(view)
                .offset(-20)
        }
        contentView.addSubview(loremLbl)
        
        loremLbl.snp.makeConstraints { make in
            make.top.equalTo(bioLbl.snp.bottom)
                .offset(40)
            make.left.equalTo(view)
                .offset(20)
            make.right.equalTo(view)
                .offset(-20)
            make.bottom.equalTo(scrollView)
        }
    }
}




