//
//  SpecialProductCell.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/10.
//

import UIKit

class SpecialProductCell: UITableViewCell {
    
    var timer:Timer!
    var totalSecond: Int = 0
    
    // MARK: - UIComponents
    @IBOutlet weak var specialTitleLabel: UILabel!
    @IBOutlet weak var productPointLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var salePriceLabel: UILabel!
    @IBOutlet weak var originPriceLabel: UILabel!
    
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var timeOutView: UIView!
    @IBOutlet weak var timeOutLabel: UILabel!
    
    @IBAction func cartTapped(_ sender: Any) {
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
//        print("\(totalSecond)")
        setUI()
        todayRemainTimeToSecond()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {(t) in
            self.totalSecond -= 1
            self.updateTimer()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Functions
    
    func setUI(){
        timeOutView.isHidden = true
        timeOutLabel.isHidden = true
    }
    
    // 오늘 날짜 남은 시간 초로 변환해서 만들기
    func todayRemainTimeToSecond(){
        let date = Date()
        let formatter = DateFormatter();
        formatter.dateFormat = "HHmmss"
        let msg = formatter.string(from: date)
        print(msg)
        let h = 23 - Int(msg.substring(from: 0, to: 2))!
        let m = 60 - Int(msg.substring(from: 2, to: 4))!
        let s = 60 - Int(msg.substring(from: 4, to: 6))!
        totalSecond = (h*3600) + (m*60) + s
    }
    
    // 라벨에 시, 분, 초 업데이트하는 부분
    func updateTimer(){
        if totalSecond == 0 {
            stopTimer()
            timeOutView.isHidden = false
            timeOutView.alpha = 0.6
            timeOutLabel.isHidden = false
            return
        }
        let H = totalSecond / 3600
        let M = totalSecond / 60 - H * 60
        let S = totalSecond % 60
        
        let stringH = H < 10 ? "0" + String(H) : String(H)
        let stringM = M < 10 ? "0" + String(M) : String(M)
        let stringS = S < 10 ? "0" + String(S) : String(S)
        
        
        //타이머 색상 설정
        if self.totalSecond < 600 {
            self.hourLabel.textColor = UIColor.red
            self.minuteLabel.textColor = UIColor.red
            self.secondLabel.textColor = UIColor.red
        } else {
            self.hourLabel.textColor = UIColor.black
            self.minuteLabel.textColor = UIColor.black
            self.secondLabel.textColor = UIColor.black
        }
        
        self.hourLabel.text = stringH
        self.minuteLabel.text = stringM
        self.secondLabel.text = stringS
    }
    
    // 이 부분은 남은 시간이 0일때 호출
    func stopTimer(){
        //지금 돌아가고 있는 타이머를 꺼달라.
        timer?.invalidate()
        timer = nil //타이머 꺼짐.
    }
}
