//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 08.03.2023.
//

import SnapKit
import UIKit
import SDWebImage

class RocketsViewController: UIViewController, ConstraintRelatableTarget {
    
    var viewModel = RocketViewModel()
    var index = Int()
    var rocket: Rocket?
    init(index: Int = Int()) {
        super.init(nibName: nil, bundle: nil)
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.insetsLayoutMarginsFromSafeArea = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var rocketImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var rocketsInfoView = RocketInfoView()
    
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        label.font = UIFont(name: "LabGrotesque-Medium", size: 24)
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "setting"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //        loadRocketInfo(index: index)
        setupUI()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(views: [rocketImage, rocketsInfoView])
        rocketsInfoView.addSubviews(views: [rocketNameLabel, settingsButton])
        //        viewModel.fetchedRockets(index: index) { rocket in
        //            guard let url = URL(string: rocket.flickrImages?.randomElement() ?? "") else { return }
        //            self.rocketImage.sd_setImage(with: url)
        //            self.rocketNameLabel.text = rocket.name
        //
        //        }
        loadRocketInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
        
    }
    
    private func setupUI() {
        // corner radius of top corners rocketsInfoView
        rocketsInfoView.clipsToBounds = true
        rocketsInfoView.layer.cornerRadius = 30
        rocketsInfoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @objc private func settingsButtonAction() {
        present(SettingsViewController(), animated: true)
    }
    
    private func loadRocketInfo() {
        viewModel.fetchedRockets(index: index) { rocket in
            guard let url = URL(string: rocket.flickrImages?.randomElement() ?? "") else { return }
            self.rocketImage.sd_setImage(with: url)
            self.rocketNameLabel.text = rocket.name
        }
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).inset(-60)
            make.bottom.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.width.equalTo(scrollView)
            if UIScreen.main.bounds.height < 800 {
                make.height.equalTo(view.frame.height + 150)
            } else if UIScreen.main.bounds.height > 800 && UIScreen.main.bounds.height <= 813 {
                make.height.equalTo(view.frame.height + 50)
            } else {
                make.height.equalTo(890)
                scrollView.isScrollEnabled = true
            }
        }
        
        rocketImage.snp.makeConstraints { make in
            rocketImage.snp.removeConstraints()
            make.top.equalToSuperview().inset(-40)
            make.left.right.equalToSuperview()
            make.height.equalTo(325)
        }
        rocketsInfoView.snp.makeConstraints { make in
            make.top.equalTo(rocketImage).offset(248)
            make.left.right.bottom.equalToSuperview()
        }
        rocketNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(48)
            make.left.equalToSuperview().inset(32)
            make.width.equalTo(146)
        }
        settingsButton.snp.makeConstraints { make in
            make.height.equalTo(26)
            make.width.equalTo(26)
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(35)
        }
    }
}

