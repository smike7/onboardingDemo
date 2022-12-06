//
//  ViewController.swift
//  onboardngDemo
//
//  Created by Faisal on 05/12/2022.
//

import UIKit
import SnapKit

class firstVC: UIViewController {
    
    private lazy var largeTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 40, weight: .bold), compatibleWith: .current)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.text = "Ready to get started ?"
        return lbl
    }()
    
    private lazy var subTitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .secondaryLabel
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 18, weight: .regular), compatibleWith: .current)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 0
        lbl.text = "Explore, sell and create your NFTs"
        return lbl
    }()
    
    private lazy var startBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Go To Profile", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 16
        btn.layer.cornerCurve = .continuous
        btn.layer.shadowRadius = 15
        btn.layer.shadowOffset = CGSize(width: 0, height: 20)
        btn.layer.shadowOpacity = 0.35
        btn.layer.shadowColor = UIColor.white.cgColor
        btn.layer.masksToBounds = false
        return btn
    }()
    private lazy var imageStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.alignment = .center
        sv.spacing = 10
        return sv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .systemBackground
        setupLayout()
        startBtn.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
    }

    @objc private func startTapped() {
        self.dismiss(animated: true)
    }
}
//MARK: - Layout Constraints
extension firstVC {
    func setupLayout() {
        view.addSubview(largeTitleLbl)
        largeTitleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview()
                .offset(150)
            make.left.right.equalToSuperview()
                .offset(20)
        }
        
        view.addSubview(subTitleLbl)
        subTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(largeTitleLbl.snp.bottom)
                .offset(12)
            make.left.right.equalToSuperview()
                .offset(20)
        }
        
        view.addSubview(imageStackView)
        
        imageStackView.snp.makeConstraints { make in
            make.top.equalTo(subTitleLbl.snp.bottom)
                .offset(40)
            make.right.equalToSuperview()
                .offset(-20)
            make.left.equalToSuperview()
                .offset(20)
            make.height.equalTo(166)
        }
        for imageName in ["image1", "image2", "image3"] {
            let imageV = UIImageView()
            guard let img = UIImage(named: imageName) else {continue}
            imageV.image = img
            imageV.contentMode = .scaleToFill
            imageStackView.addArrangedSubview(imageV)
        }
        
        view.addSubview(startBtn)
        startBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom)
                .offset(-150)
            make.height.equalTo(45)
            make.right.equalToSuperview()
                .offset(-20)
            make.left.equalToSuperview()
                .offset(20)
        }
    }
    
    
}

