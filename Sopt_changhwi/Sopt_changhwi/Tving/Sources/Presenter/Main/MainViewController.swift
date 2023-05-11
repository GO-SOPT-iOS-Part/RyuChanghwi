//
//  MainViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit
import SnapKit
import Then

class MainViewController : BaseViewController {
    var currrentIndex = 0
    // MARK: - PROPERTIES
    private lazy var homePageViewController = HomePageViewController()
    private lazy var realTimePageViewController = RealTimePageViewController()
    private lazy var tvProgramPageController = TvProgramPageController()
    private lazy var moviePageViewController = MoviePageViewController()
    private lazy var paramountPageViewController = ParamountPageViewController()
    
    private lazy var viewControllers : [UIViewController] = {
        return [homePageViewController, realTimePageViewController, tvProgramPageController, moviePageViewController, paramountPageViewController]
    }()
    
    private let pageViewController : UIPageViewController = {
        let viewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return viewController
    }()
    
    private let tvingButton = UIButton().then {
        $0.setImage(.tvingWhiteImage, for: .normal)
    }
    
    private let bearsButton = UIButton().then {
        $0.setImage(.bearsImage, for: .normal)
    }
    
    private let categoryBackView = UIView()
    
    private let categoryScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let categoryContentView = UIView()
    
    private let categoryStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 28
    }
    
    private let pagerBarBackView = UIView()
    
    private let pagerBarView = UIView()
    
    private let homeCategoryButton = UIButton().then {
        $0.setTitle("홈", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.regular, size: 17)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    
    private let realTimeCategoryButton = UIButton().then {
        $0.setTitle("실시간", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.regular, size: 17)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    
    private let tvProgramCategoryButton = UIButton().then {
        $0.setTitle("TV프로그램", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.regular, size: 17)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    
    private let movieCategoryButton = UIButton().then {
        $0.setTitle("영화", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.regular, size: 17)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    
    private let patamountPlusCategoryButton = UIButton().then {
        $0.setTitle("파라마운트+", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.regular, size: 17)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController.delegate = self
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func setStyle() {
        super.setStyle()
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = bearsButton
        navigationItem.rightBarButtonItem = rightBarButton
    
        pagerBarBackView.backgroundColor = .color2E2E2E
        pagerBarView.backgroundColor = .white
        
        pageViewController.didMove(toParent: self)
        pageViewController.view.frame = self.view.frame
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
        self.addChild(pageViewController)
    }
    override func setLayout() {
        super.setLayout()
        
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = tvingButton
        navigationItem.leftBarButtonItem = leftBarButton
        
        view.addSubviews(categoryBackView, pageViewController.view)
        
        categoryBackView.addSubview(categoryScrollView)
        categoryScrollView.addSubview(categoryContentView)
        categoryContentView.addSubviews(categoryStackView, pagerBarBackView)
        categoryStackView.addArrangedSubviews(homeCategoryButton, realTimeCategoryButton, tvProgramCategoryButton, movieCategoryButton, patamountPlusCategoryButton)
        pagerBarBackView.addSubview(pagerBarView)
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(pagerBarBackView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        categoryBackView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        categoryScrollView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        categoryContentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        pagerBarBackView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(3)
        }
        categoryStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        pagerBarView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(3)
            $0.width.equalTo(15)
            $0.centerX.equalTo(homeCategoryButton.snp.centerX)
        }

    }
    // MARK: - ACTIONS
    override func actions() {
        super.actions()
        bearsButton.addTarget(self, action: #selector(bearsButtonTapped), for: .touchUpInside)
        

        homeCategoryButton.addTarget(self, action: #selector(homeCategoryButtonTapped), for: .touchUpInside)
        realTimeCategoryButton.addTarget(self, action: #selector(realTimeCategoryTapped), for: .touchUpInside)
        tvProgramCategoryButton.addTarget(self, action: #selector(tvProgramCategoryButtonTapped), for: .touchUpInside)
        movieCategoryButton.addTarget(self, action: #selector(movieCategoryButtonTapped), for: .touchUpInside)
        patamountPlusCategoryButton.addTarget(self, action: #selector(patamountPlusCategoryButtonTapped), for: .touchUpInside)
    }
    
    @objc func bearsButtonTapped() {
        let myPageViewController = MyPageViewController()
        myPageViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    @objc func homeCategoryButtonTapped() {
        categoryAnimation(category: Category.home)
        if currrentIndex > 0 {
            pageViewController.setViewControllers([viewControllers[0]], direction: .reverse, animated: true)
        }
        else {
            pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
        }
        currrentIndex = 0
    }
    @objc func realTimeCategoryTapped() {
        categoryAnimation(category: Category.realTime)
        if currrentIndex > 1 {
            pageViewController.setViewControllers([viewControllers[1]], direction: .reverse, animated: true)
        }
        else {
            pageViewController.setViewControllers([viewControllers[1]], direction: .forward, animated: true)
        }
        currrentIndex = 1
    }
    @objc func tvProgramCategoryButtonTapped() {
        categoryAnimation(category: Category.tvProgram)
        if currrentIndex > 2 {
            pageViewController.setViewControllers([viewControllers[2]], direction: .reverse, animated: true)
        }
        else {
            pageViewController.setViewControllers([viewControllers[2]], direction: .forward, animated: true)
        }
        currrentIndex = 2
    }
    @objc func movieCategoryButtonTapped() {
        categoryAnimation(category: Category.movie)
        if currrentIndex > 3 {
            pageViewController.setViewControllers([viewControllers[3]], direction: .reverse, animated: true)
        }
        else {
            pageViewController.setViewControllers([viewControllers[3]], direction: .forward, animated: true)
        }
        currrentIndex = 3
    }
    @objc func patamountPlusCategoryButtonTapped() {
        categoryAnimation(category: Category.paramount)
        if currrentIndex > 4 {
            pageViewController.setViewControllers([viewControllers[4]], direction: .reverse, animated: true)
        }
        else {
            pageViewController.setViewControllers([viewControllers[4]], direction: .forward, animated: true)
        }
        currrentIndex = 4
    }

    func categoryAnimation(category : Category) {
        switch category {
        case .home:
            pagerBarView.snp.remakeConstraints {
                $0.centerX.equalTo(homeCategoryButton.snp.centerX)
                $0.width.equalTo(homeCategoryButton.snp.width)
                $0.height.equalTo(3)
            }
        case .realTime:
            pagerBarView.snp.remakeConstraints {
                $0.centerX.equalTo(realTimeCategoryButton.snp.centerX)
                $0.width.equalTo(realTimeCategoryButton.snp.width)
                $0.height.equalTo(3)

            }
        case .tvProgram:
            pagerBarView.snp.remakeConstraints {
                $0.centerX.equalTo(tvProgramCategoryButton.snp.centerX)
                $0.width.equalTo(tvProgramCategoryButton.snp.width)
                $0.height.equalTo(3)

            }
        case .movie:
            pagerBarView.snp.remakeConstraints {
                $0.centerX.equalTo(movieCategoryButton.snp.centerX)
                $0.width.equalTo(movieCategoryButton.snp.width)
                $0.height.equalTo(3)

            }
        case .paramount:
            pagerBarView.snp.remakeConstraints {
                $0.centerX.equalTo(patamountPlusCategoryButton.snp.centerX)
                $0.width.equalTo(patamountPlusCategoryButton.snp.width)
                $0.height.equalTo(3)

            }
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.pagerBarView.superview?.layoutIfNeeded()
        })
    }
}
// MARK: - EXTENSIONs
extension MainViewController : UIPageViewControllerDelegate {
    
}

///애니메이션
enum Category {
    case home
    case realTime
    case tvProgram
    case movie
    case paramount
}
