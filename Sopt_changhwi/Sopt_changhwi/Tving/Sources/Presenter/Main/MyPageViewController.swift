//
//  MyPageViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit

class MyPageViewController : BaseViewController {
    private let firstDummy = MyPageButton.dummy1()
    private let secondDummy = MyPageButton.dummy2()
    // MARK: - PROPERTIES
    private let backButton = UIButton().then {
        $0.setImage(.backImage, for: .normal)
    }
    private let bellButton = UIButton().then {
        $0.setImage(.bellImage, for: .normal)
    }
    private let gearButton = UIButton().then {
        $0.setImage(.gearImage, for: .normal)
    }
    
    private let myPageHeaderView = MyPageHeaderView()
    
    private let myPageTableView = UITableView(frame: CGRect.zero, style: .grouped).then {
        $0.backgroundColor = .color000000
    }
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func setStyle() {
        super.setStyle()
        navigationController?.navigationBar.barTintColor = .color000000
        navigationController?.navigationBar.isTranslucent = false
        
        
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = backButton
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarGearButton = UIBarButtonItem()
        rightBarGearButton.customView = gearButton
        let rightBarBellButton = UIBarButtonItem()
        rightBarBellButton.customView = bellButton
        navigationItem.rightBarButtonItems = [rightBarGearButton, rightBarBellButton]
        
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        myPageTableView.register(MyPageButtonCell.self, forCellReuseIdentifier: MyPageButtonCell.identifier)
        myPageTableView.register(MyPageHeaderView.self, forHeaderFooterViewReuseIdentifier: MyPageHeaderView.headerViewID)
        myPageTableView.sectionFooterHeight = 0
        
    }
    override func setLayout() {
        super.setLayout()
        [myPageTableView].forEach {
            view.addSubview($0)
        }
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - ACTIONS
    override func actions() {
        super.actions()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
// MARK: - EXTENSIONs
extension MyPageViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstDummy.count
        case 1:
            return secondDummy.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 320
        }
        else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MyPageHeaderView.headerViewID) as? MyPageHeaderView else { return nil }
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageButtonCell.identifier, for: indexPath) as? MyPageButtonCell else { return UITableViewCell() }
        if indexPath.section == 0 {
            cell.configureCell(firstDummy[indexPath.row])
        }
        else {
            cell.configureCell(secondDummy[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    
}
