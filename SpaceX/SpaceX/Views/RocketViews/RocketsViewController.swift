//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Evgeniy Docenko on 08.03.2023.
//

import SnapKit
import UIKit
import SDWebImage

class RocketsViewController: UIViewController, ReloadCollectionView {
    func reloadData() {
        measureCollectionView.reloadData()
    }
    
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
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private lazy var showLaunchesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show launches", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: FontNames.labGrotesqueBold.rawValue, size: 18)
        button.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(showLaunchesButtonAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(views: [rocketImage, rocketsInfoView])
        rocketsInfoView.addSubviews(views: [rocketNameLabel, settingsButton, measureCollectionView, showLaunchesButton])
        
        measureCollectionView.delegate = self
        measureCollectionView.dataSource = self
        measureCollectionView.register(MeasureCollectionViewCell.self, forCellWithReuseIdentifier: MeasureCollectionViewCell.id)
        measureCollectionView.register(RocketWikiCollectionViewCell.self, forCellWithReuseIdentifier: RocketWikiCollectionViewCell.id)
        measureCollectionView.register(FirstStageCollectionViewCell.self, forCellWithReuseIdentifier: FirstStageCollectionViewCell.id)
        measureCollectionView.register(SecondStageCollectionViewCell.self, forCellWithReuseIdentifier: SecondStageCollectionViewCell.id)
        measureCollectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.id)
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
        edgesForExtendedLayout = .top
        rocketsInfoView.clipsToBounds = true
        rocketsInfoView.layer.cornerRadius = 30
        rocketsInfoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @objc private func settingsButtonAction() {
        let vc = SettingsViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc private func showLaunchesButtonAction() {
        let vc = LaunchesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func loadRocketInfo() {
        viewModel.fetchedRockets(index: index) { rocket in
            guard let url = URL(string: rocket.flickrImages?.randomElement() ?? "") else { return }
            self.rocketImage.sd_setImage(with: url)
            self.rocketNameLabel.text = rocket.name
            self.measureCollectionView.reloadData()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            if sectionNumber ==  0 {
                return self.measureCollectionView.measuresSectionLayout()
            } else if sectionNumber ==  1 {
                return self.measureCollectionView.rocketWikiSectionLayout()
            } else if sectionNumber == 2 {
                return self.measureCollectionView.firstStageSectionLayout()
            } else {
                return self.measureCollectionView.secondStageSectionLayout()
            }
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
                make.height.equalTo(1250)
                scrollView.isScrollEnabled = true
            }
        }
        
        rocketImage.snp.makeConstraints { make in
            make.top.equalTo(-(navigationController?.navigationBar.frame.size.height ?? 0))
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
            make.height.equalTo(900)
            make.top.equalTo(settingsButton).inset(54)
            make.left.right.equalTo(rocketsInfoView).inset(0)
        }
        showLaunchesButton.snp.makeConstraints { make in
            make.width.equalTo(311)
            make.height.equalTo(56)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView).inset(0)
        }
    }
}

extension RocketsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.listOfRockets.isEmpty {
            return 0
        } else {
            switch section {
            case 0:
                return 4
            default:
                return 3
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeasureCollectionViewCell.id, for: indexPath) as? MeasureCollectionViewCell else { return UICollectionViewCell() }
        guard let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketWikiCollectionViewCell.id, for: indexPath) as? RocketWikiCollectionViewCell else { return UICollectionViewCell() }
        guard let thirdCell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstStageCollectionViewCell.id, for: indexPath) as? FirstStageCollectionViewCell else { return UICollectionViewCell() }
        guard let fourthCell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondStageCollectionViewCell.id, for: indexPath) as? SecondStageCollectionViewCell else { return UICollectionViewCell() }
        switch indexPath.section {
        case 0:
            cell.configureCell(with: viewModel.listOfRockets[index], quantity: Quantity.allCases[indexPath.row], indexPath: indexPath)
            return cell
        case 1:
            secondCell.configureCell(with: viewModel.listOfRockets[index], indexPath: indexPath)
            return secondCell
        case 2:
            thirdCell.configureCell(with: viewModel.listOfRockets[index], indexPath: indexPath)
            return thirdCell
        case 3:
            fourthCell.configureCell(with: viewModel.listOfRockets[index], indexPath: indexPath)
            return fourthCell
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.id, for: indexPath) as? Header else { return UICollectionReusableView() }
        switch indexPath.section {
        case 2: header.headerLabel.text = FirstStageInfo.header.rawValue
        case 3: header.headerLabel.text = SecondStageInfo.header.rawValue
        default: return header
        }
        return header
    }
}

extension RocketsViewController: UICollectionViewDelegate { }

extension RocketsViewController: UIPageViewControllerDelegate {
    
}
