//
//  WeatherMainViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/11.
//

import UIKit
import SnapKit
import Then
import Kingfisher
import MapKit


class CampingMainViewController : BaseViewController {
    var campingData : CampingResposne?
    // MARK: - PROPERTIES
    private let campingTableView = UITableView()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchCampingService.shared.searchCapming { response in
            switch response {
            case .success(let data):
                guard let data = data as? CampingResposne else {
                    return
                }
                self.campingData = data
                self.campingTableView.reloadData()
                
            default:
                return
            }
        }
        
    }
    override func setStyle() {
        campingTableView.rowHeight = 100
        campingTableView.delegate = self
        campingTableView.dataSource = self
        campingTableView.register(CampingListCell.self, forCellReuseIdentifier: CampingListCell.identifier)
    }
    override func setLayout() {
        view.addSubview(campingTableView)
        campingTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension CampingMainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        campingData?.response.body.items.item.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CampingListCell.identifier, for: indexPath) as? CampingListCell else { return UITableViewCell() }
        

        cell.configureCell((campingData?.response.body.items.item[indexPath.row])!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        let selectedData = campingData?.response.body.items.item[selectedRow]
        let campingDetailViewController = CampingDetailViewController()
        guard let url = URL(string: selectedData?.firstImageUrl ?? "") else { return }
        campingDetailViewController.campingImageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: nil,
            completionHandler: nil
          )
        let dataValue = campingData?.response.body.items.item[indexPath.row]
        campingDetailViewController.campingNameLabel.text = dataValue?.facltNm ?? ""
        campingDetailViewController.addressLabel.text = dataValue?.addr1 ?? ""
        campingDetailViewController.introLabel.text = dataValue?.lineIntro ?? ""
        campingDetailViewController.detailInfoLabel.text = dataValue?.intro ?? ""
        campingDetailViewController.blogURL = NSURL(string: dataValue?.homepage ?? "")
        campingDetailViewController.longitudeValue = Double(dataValue?.mapX ?? "")
        campingDetailViewController.latitudeValue = Double(dataValue?.mapY ?? "")
        navigationController?.pushViewController(campingDetailViewController, animated: true)
    }
    
    
}
