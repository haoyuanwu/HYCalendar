//
//  ViewController.swift
//  Calendar
//
//  Created by 吴昊原 on 2017/9/30.
//  Copyright © 2017年 吴昊原. All rights reserved.
//

import UIKit
import HYUIkit

class CalendarViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let cellid = "calendarId"
    
    lazy var collectionView:UICollectionView = {
       let flowlayout = UICollectionViewFlowLayout()
        flowlayout.minimumLineSpacing = 0;
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.headerReferenceSize = CGSize(width: self.view.width(), height: 50)
        flowlayout.itemSize = CGSize(width: self.view.width()/7, height: self.view.width()/7)
        let collectionV:UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.width(), height: self.view.height()), collectionViewLayout: flowlayout)
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.backgroundColor = UIColor.white
        collectionV.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cellid")
        collectionV.register(CalendarCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellid)
        collectionV.register(CalendarReusableView.classForCoder(), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: "headerID")
        return collectionV;
    }()
    
    let week:[String:Int] = ["Sunday":7,"Monday":1,"Tuesday":2,"Wednesday":3,"Thursday":4,"Friday":5,"Saturday":6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.addSubview(self.collectionView)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 48
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let month = Int(NSDate().monthString())
        var monthMax = month! + section
        var year = NSDate().yearString()!
        
        
        while monthMax > 12 {
            monthMax = monthMax - 12;
            year = String(Int(year)! + 1);
        }
        
        let indexStr:String = DateTool.getTheDayOfTheWeek(byDateString: "\(year)-\(monthMax)-1")!;
        var index:Int = week[indexStr]!;
        if index == 7 {
            index = 0;
        }
        
        return self.DetermineHowManyDaysPerMonth(month: month! + section) + index ;
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let month = Int(NSDate().monthString())
        var monthMax = month! + indexPath.section
        var year = NSDate().yearString()!
        
        while monthMax > 12 {
            monthMax = monthMax - 12;
            year = String(Int(year)! + 1);
        }
        let indexStr:String = DateTool.getTheDayOfTheWeek(byDateString: "\(year)-\(monthMax)-1")!;
        var index:Int = week[indexStr]!;
        if index == 7 {
            index = 0;
        }
        if indexPath.row >= index {
            let cell:CalendarCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! CalendarCollectionViewCell
            cell.label.text = String(indexPath.item-index+1);
            
            cell.date = "\(year)-\(monthMax)-\(indexPath.item-index+1)"
            cell.contentView.backgroundColor = UIColor.white
            
            let yesterdayDate = NSDate.dayDateformIndex(-1)
            let tmpDate = NSDate.string(withDate: cell.date, formatter: "yyyy-MM-dd")
            
            let result = tmpDate?.compare(yesterdayDate!)
            if result == ComparisonResult.orderedDescending{
                cell.isTouch = true
            }else{
                cell.isTouch = false
            }
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
            cell.contentView.backgroundColor = UIColor.white
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView:CalendarReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerID", for: indexPath) as! CalendarReusableView
        
        let month = Int(NSDate().monthString())
        var monthMax = month! + indexPath.section
        var year = NSDate().yearString()!
        while monthMax > 12 {
            monthMax = monthMax - 12;
            year = String(Int(year)! + 1);
        }
        
        headerView.dateLabel.text = String("\(year)年-\(monthMax)月")
        
        return headerView;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:CalendarCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CalendarCollectionViewCell
        if cell.isTouch {
            print(cell.date)
        }
    }
    
    
    /// 判断闰年
    ///
    /// - Parameter year: 年份
    /// - Returns: 返回bool
    func judgmentYear(year: Int) -> Bool{
        if (year%4==0 && year%100==0 && year%400==0){
            return true
        }else{
            return false
        }
    }
    
    /// 判断每个月多少天
    func DetermineHowManyDaysPerMonth(month: Int) -> Int {
        let year = Int(NSDate().yearString())
//        let monthTmp = Int(NSDate().monthString())
        let isleap = self.judgmentYear(year: year!);
        var monthMax = month
        while monthMax > 12 {
            monthMax = monthMax - 12;
        }
        
        if monthMax == 2 {
            if isleap {
                return 29
            }else{
                return 28
            }
        }else if self.isSameFromArray(month: month, arr: [1,3,5,7,8,10,12]) {
            return 31
        }else{
            return 30
        }
    }
    
    func isSameFromArray( month:Int, arr: [Int]) -> Bool {
        var monthTmp = month
        while monthTmp > 12 {
            monthTmp = monthTmp - 12;
        }
        for item in arr {
            if monthTmp == item {
                return true
            }
        }
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

