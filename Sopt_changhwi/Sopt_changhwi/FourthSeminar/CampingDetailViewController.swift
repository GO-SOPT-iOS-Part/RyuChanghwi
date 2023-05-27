//
//  CampingDetailViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/12.
//

import UIKit
import SnapKit
import Then
import MapKit
import SafariServices

class CampingDetailViewController : BaseViewController {
    var blogURL : NSURL?
    var mkCoordinateSpan : MKCoordinateSpan?
    var latitudeValue : Double?
    var longitudeValue : Double?
    private let locaationManager = CLLocationManager()
    private let contentScrollView = UIScrollView()
    
    private let contentView = UIView()
    
    private let introContentView = UIView()
    
    let campingImageView = UIImageView()
    
    private let campingTitleLabel = UILabel().then {
        $0.text = "캠핑장 :"
    }
    
    let campingNameLabel = UILabel()
    
    private let addressTitleLabel = UILabel().then {
        $0.text = "주소 :"
    }
    
    let addressLabel = UILabel()
    
    private let introTitleLabel = UILabel().then {
        $0.text = "한 줄 소개 : "
    }
    let introLabel = UILabel()
    
    private let introSeparateView = UIView().then {
        $0.backgroundColor = .gray
    }
    private let detailIntroContentView = UIView()
    
    private let detailIntroTitleLabel = UILabel().then {
        $0.text = "자세한 소개"
    }
    
    let detailInfoLabel = UILabel().then {
        $0.numberOfLines = 0
    }
    private let detailIntroSeparateView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let extraInfoContentView = UIView()
    
    private let campingMapTitleLabel = UILabel().then {
        $0.text = "자세한 위치 보기 :"
    }
    
    private let campingMapView = MKMapView().then {
        $0.backgroundColor = .red
    }
    
    private let homepageButton = UIButton().then {
        $0.setTitle("홈페이지 방문", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
    }
    
    
    
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetting()
        
    }
    func mapSetting() {
        campingMapView.delegate = self
        locaationManager.delegate = self
        locaationManager.desiredAccuracy = kCLLocationAccuracyBest
        campingMapView.showsUserLocation = true
//        guard let mkCoordinateSpan = mkCoordinateSpan else { return }
        moveLocation(latitudeValue: latitudeValue!, longtudeValue: longitudeValue!, delta: 0.01)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitudeValue!, longitude: longitudeValue!)
        campingMapView.addAnnotation(annotation)

    }
    
    override func setStyle() {
        view.backgroundColor = .systemBackground
    }
    
    override func setLayout() {
        view.addSubview(contentScrollView)
        contentScrollView.addSubview(contentView)
        contentView.addSubviews(introContentView, introSeparateView, detailIntroContentView, detailIntroSeparateView, extraInfoContentView)
        introContentView.addSubviews(campingImageView, campingTitleLabel, campingNameLabel, addressTitleLabel, addressLabel, introTitleLabel, introLabel)
        detailIntroContentView.addSubviews(detailIntroTitleLabel, detailInfoLabel)
        
        extraInfoContentView.addSubviews(campingMapTitleLabel, campingMapView, homepageButton)
        
        contentScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        introContentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        campingImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        campingTitleLabel.snp.makeConstraints {
            $0.top.equalTo(campingImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        campingNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalTo(campingTitleLabel.snp.bottom).offset(4)
        }
        addressTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(campingNameLabel.snp.bottom).offset(10)
        }
        addressLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalTo(addressTitleLabel.snp.bottom).offset(4)
        }
        introTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(addressLabel.snp.bottom).offset(10)
        }
        introLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.top.equalTo(introTitleLabel.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().inset(12)
        }
        introSeparateView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(introContentView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        detailIntroContentView.snp.makeConstraints {
            $0.top.equalTo(introSeparateView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        detailIntroTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
        }
        detailInfoLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.top.equalTo(detailIntroTitleLabel.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().inset(12)
        }
        detailIntroSeparateView.snp.makeConstraints {
            $0.top.equalTo(detailIntroContentView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        extraInfoContentView.snp.makeConstraints {
            $0.top.equalTo(detailIntroSeparateView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        campingMapTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(10)
        }
        campingMapView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(campingMapTitleLabel.snp.bottom).offset(10)
            $0.height.equalTo(300)
        }
        homepageButton.snp.makeConstraints {
            $0.top.equalTo(campingMapView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
            $0.bottom.equalToSuperview().inset(30)
        }
        
    }
    
    // MARK: - ACTIONS
    override func actions() {
        homepageButton.addTarget(self, action: #selector(homepageButtonTapped), for: .touchUpInside)
    }
    @objc func homepageButtonTapped() {
        let blogSafariView : SFSafariViewController = SFSafariViewController(url: blogURL as? URL ?? NSURL(string: "")! as URL)
        self.present(blogSafariView, animated: true)
    }
}

extension CampingDetailViewController : MKMapViewDelegate, CLLocationManagerDelegate {
    func moveLocation(latitudeValue: CLLocationDegrees, longtudeValue: CLLocationDegrees, delta span: Double) {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longtudeValue)
        let pSpanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: pSpanValue)
        campingMapView.setRegion(pRegion, animated: true)
    }
}
