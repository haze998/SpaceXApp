//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 08.03.2023.
//

import SnapKit
import UIKit
import SDWebImage

class RocketsViewController: UIViewController {
    
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
        image.contentMode = .scaleToFill
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
    
    private lazy var measureCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.fetchedRockets(index: index) { _ in
//            self.measureCollectionView.reloadData()
//        }
        setupUI()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(views: [rocketImage, rocketsInfoView])
        rocketsInfoView.addSubviews(views: [rocketNameLabel, settingsButton, measureCollectionView])
        
        measureCollectionView.delegate = self
        measureCollectionView.dataSource = self
        measureCollectionView.register(MeasureCollectionViewCell.self, forCellWithReuseIdentifier: MeasureCollectionViewCell.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRocketInfo()
        
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
            print("rocket: \(rocket)")
            self.measureCollectionView.reloadData()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in return self.measureCollectionView.measuresSectionLayout()
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
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(450)
        }
        rocketsInfoView.snp.makeConstraints { make in
            make.top.equalTo(rocketImage).offset(388)
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
        measureCollectionView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.top.equalTo(settingsButton).inset(54)
            make.left.right.equalTo(rocketsInfoView).inset(0)
            
        }
    }
}

extension RocketsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.listOfRockets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeasureCollectionViewCell.id, for: indexPath) as? MeasureCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel.listOfRockets[index], quantity: Quantity.allCases[indexPath.row], indexPath: indexPath)
        return cell
    }
}

extension RocketsViewController: UICollectionViewDelegate { }

extension RocketsViewController: UIPageViewControllerDelegate {
    
}
