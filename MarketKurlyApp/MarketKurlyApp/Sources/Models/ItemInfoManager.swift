//
//  ItemInfoManager.swift
//  MarketKurlyApp
//
//  Created by 이하연 on 2022/01/20.
//

import UIKit

class ItemInfoManager {
    static let shared = ItemInfoManager()
    
    private init() {}
    
    // 주제
    var subjectList: [AllSubjectDocument]?
    var itemesList: [Int:[SubjectItemesDocument]] = [:]
    
    func setSubjectList(_ info: [AllSubjectDocument]) {
        self.subjectList = info
    }
    
    func getSubjectList() -> [AllSubjectDocument]? {
        guard let subjectList = self.subjectList else { return nil }
        return subjectList
    }
    
    func addItemList(subjectId: Int,itemList: [SubjectItemesDocument] ){
        itemesList[subjectId] = itemList
    }
    func getItemList(subjectId: Int ) -> [SubjectItemesDocument]{
        return itemesList[subjectId] ?? []
    }
    
}
