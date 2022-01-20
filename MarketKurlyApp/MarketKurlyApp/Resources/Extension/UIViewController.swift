//
//  UIViewController.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/09.
//

import UIKit
import MapKit
import Kingfisher
import Then
import MaterialComponents.MaterialBottomSheet

extension UIViewController {
    // MARK: 빈 화면을 눌렀을 때 키보드가 내려가도록 처리
    func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        //        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    // MARK: 취소와 확인이 뜨는 UIAlertController
    func presentAlert(title: String, message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      handler: ((UIAlertAction) -> Void)? = nil) {
        self.dismissIndicator()
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(actionDone)
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: 커스텀 UIAction이 뜨는 UIAlertController
    func presentAlert(title: String, message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      with actions: UIAlertAction ...) {
        self.dismissIndicator()
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    // MARK: UIWindow의 rootViewController를 변경하여 화면전환
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    // MARK: 커스텀 하단 경고창
    func presentBottomAlert(message: String, target: NSLayoutYAxisAnchor? = nil, offset: Double? = -12) {
        view.subviews
            .filter { $0.tag == 936419836287461 }
            .forEach { $0.removeFromSuperview() }
        
        let alertSuperview = UIView()
        alertSuperview.tag = 936419836287461
        alertSuperview.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        alertSuperview.layer.cornerRadius = 10
        alertSuperview.isHidden = true
        alertSuperview.translatesAutoresizingMaskIntoConstraints = false
        
        let alertLabel = UILabel()
        alertLabel.font = .NotoSans(.regular, size: 15)
        alertLabel.textColor = .white
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(alertSuperview)
        alertSuperview.bottomAnchor.constraint(equalTo: target ?? view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        alertSuperview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertSuperview.addSubview(alertLabel)
        alertLabel.topAnchor.constraint(equalTo: alertSuperview.topAnchor, constant: 6).isActive = true
        alertLabel.bottomAnchor.constraint(equalTo: alertSuperview.bottomAnchor, constant: -6).isActive = true
        alertLabel.leadingAnchor.constraint(equalTo: alertSuperview.leadingAnchor, constant: 12).isActive = true
        alertLabel.trailingAnchor.constraint(equalTo: alertSuperview.trailingAnchor, constant: -12).isActive = true
        
        alertLabel.text = message
        alertSuperview.alpha = 1.0
        alertSuperview.isHidden = false
        UIView.animate(
            withDuration: 2.0,
            delay: 1.0,
            options: .curveEaseIn,
            animations: { alertSuperview.alpha = 0 },
            completion: { _ in
                alertSuperview.removeFromSuperview()
            }
        )
    }
    
    // MARK: 인디케이터 표시
    func showIndicator() {
        IndicatorView.shared.show()
        IndicatorView.shared.showIndicator()
    }
    
    // MARK: 인디케이터 숨김
    @objc func dismissIndicator() {
        IndicatorView.shared.dismiss()
    }
    
    // MARK: 네비게이션바 마켓컬리 색상으로 변경
    func bgKurlyColor(_ navi: UINavigationController,_ naviItem: UINavigationItem , title: String){
        navi.navigationBar.barTintColor = UIColor.mainKurlyPurple
        navi.navigationBar.isTranslucent = false
        navi.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        naviItem.title = title
    }
    
    // MARK: 네비게이션 바의 하단 그림자 제거
    func removeLine(_ navi: UINavigationController) {
        navi.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navi.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: 네비게이션바 색상 커스텀
    func customNavigationBarAttribute(_ backgroundColor: UIColor,
                                      _ titleColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        appearance.shadowColor = .clear
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - 버튼 커스텀
    func customButton(_ customBtn: UIButton, cornerValue: CGFloat?, btnBorderColor: UIColor?, btnBorderWidth: CGFloat?){
        customBtn.layer.cornerRadius = cornerValue ?? 0
        customBtn.layer.borderColor = btnBorderColor?.cgColor
        customBtn.layer.borderWidth = btnBorderWidth ?? 0
    }
    
    // MARK: - 텍스트필드 커스텀
    func customTextField(_ customTF: UITextField, cornerValue: CGFloat?, tFBorderColor: UIColor?, tFBorderWidth: CGFloat?){
        customTF.layer.cornerRadius = cornerValue ?? 0
        customTF.layer.borderColor = tFBorderColor?.cgColor
        customTF.layer.borderWidth = tFBorderWidth ?? 0
    }
    
    // MARK: - 뷰 커스텀
    func customView(_ customView: UIView, cornerValue: CGFloat?, viewBorderColor: UIColor?, viewBorderWidth: CGFloat?){
        customView.layer.cornerRadius = cornerValue ?? 0
        customView.layer.borderColor = viewBorderColor?.cgColor
        customView.layer.borderWidth = viewBorderWidth ?? 0
    }
    
    // MARK: - url -> img
    func urlToImg(urlStr: String, img: UIImageView){
        if let url: URL = URL(string: urlStr ){
            img.kf.indicatorType = .activity
            img.kf.setImage(with:url)
        }
    }
    
    func customNaviBarItem(btnColor: UIColor, naviItem: UINavigationItem){
        
        lazy var mapLeftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
            $0.setImage(UIImage(systemName: "map"), for: .normal)
            $0.tintColor = btnColor
            $0.addTarget(self, action: #selector(self.addressBarBtnTapped(_:)), for: .touchUpInside)
        }
        lazy var cartRightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
            $0.setImage(UIImage(systemName: "cart"), for: .normal)
            $0.tintColor = btnColor
            $0.addTarget(self, action: #selector(self.cartBarBtnTapped(_:)), for: .touchUpInside)
        }
        let leftBarBtnItem = UIBarButtonItem(customView: mapLeftBtn)
        let rightBarBtnItem = UIBarButtonItem(customView: cartRightBtn)
        
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 15
        naviItem.rightBarButtonItems = [rightBarBtnItem,space,leftBarBtnItem]
        
    }
    
    
    func customNaviBarItem2(btnColor: UIColor, naviItem: UINavigationItem){
        
        lazy var cartRightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
            $0.setImage(UIImage(systemName: "cart"), for: .normal)
            $0.tintColor = btnColor
            $0.addTarget(self, action: #selector(self.cartBarBtnTapped(_:)), for: .touchUpInside)
        }
        let rightBarBtnItem = UIBarButtonItem(customView: cartRightBtn)
        naviItem.rightBarButtonItems = [rightBarBtnItem]
    }
    
    func dismissArrowBtn(btnColor: UIColor, naviItem: UINavigationItem){
        let icon = UIImage(named: "arrow")
        let iconSize = CGRect(origin: CGPoint.zero, size: CGSize(width: 5, height: 5))
        let iconButton = UIButton(type: .system)
        iconButton.frame = iconSize
        iconButton.setBackgroundImage(icon, for: .normal)
        let barButton = UIBarButtonItem(customView: iconButton)
        iconButton.addTarget(self, action: #selector(addressBarBtnTapped(_:)), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = barButton
        
        
        //        lazy var arrowLeftBtn = UIButton().then {
        //            $0.setImage(UIImage(named: "arrow"), for: .normal)
        //            $0.tintColor = btnColor
        //            $0.imageView?.contentMode = .scaleAspectFit
        //            $0.addTarget(self, action: #selector(self.cartBarBtnTapped(_:)), for: .touchUpInside)
        //            $0.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        //        }
        //        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        //        space.width = 15
        //        let leftBarBtnItem = UIBarButtonItem(customView: arrowLeftBtn)
        //        naviItem.leftBarButtonItems = [leftBarBtnItem]
    }
    
    
    
    @objc func addressBarBtnTapped(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Address", bundle: nil)
        let ModalAddressVC = storyboard.instantiateViewController(identifier: "ModalAddressSB")
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: ModalAddressVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 480
        bottomSheet.scrimColor = UIColor.black.withAlphaComponent(0.5)
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @objc func cartBarBtnTapped(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let ModalAddressVC = storyboard.instantiateViewController(identifier: "CartSB")
        ModalAddressVC.modalPresentationStyle = .fullScreen
        present(ModalAddressVC, animated: true, completion: nil)
        
    }
    
    // MARK: - 네비게이션 타이틀 없애기
    func naviTitleDelete(navi: UINavigationController){
        navi.navigationBar.tintColor = .black
        navi.navigationBar.topItem?.title = ""
    }
    
    // MARK: - 세자리 숫자마다 콤마 넣기
    func DecimalWon(value: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
        
        return result
    }
    
    // MARK: - 취소선
    func cancleLine(text: String, targetLabel: UILabel){
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.strikethroughStyle, value: 1.07, range: (text as NSString).range(of: text))
        targetLabel.attributedText = attributedString
    }
    
    // MARK: - 이미지 변환
    func urlToImg(urlStr: String, targetImg: UIImageView ){
        if let url: URL = URL(string: urlStr){
            targetImg.kf.indicatorType = .activity
            targetImg.kf.setImage(with:url)
        }
    }
    
    
    func getFormattedDate(dateString: String) -> String{
        let testDate = dateString.substring(from: 0, to: 10)
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "yyyy년 MM월 dd일 12시까지"
            let date: Date? = dateFormatterGet.date(from: testDate)
            return dateFormatterPrint.string(from: date!);
        }
    
    func getFormattedDate2(dateString: String) -> String{
        let testDate = dateString.substring(from: 0, to: 10)
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd"

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MM.dd 12시"
            let date: Date? = dateFormatterGet.date(from: testDate)
            return dateFormatterPrint.string(from: date!);
        }
}
