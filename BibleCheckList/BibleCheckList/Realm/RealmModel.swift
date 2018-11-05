//
//  RealmModel.swift
//  BibleCheckList
//
//  Created by eunjin Jo on 2018. 10. 22..
//  Copyright © 2018년 eunjin. All rights reserved.
//

import Foundation
import RealmSwift

enum Category:String{
    case old = "구약"
    case new = "신약"
    case daily = "Daily"
}

class PageObject:Object{
    @objc dynamic var pageNumber:String = ""
    @objc dynamic var isRead:Bool = false
    
    convenience init(pageNumber:String,isRead:Bool = false) {
        self.init()
        self.pageNumber = pageNumber
        self.isRead = isRead
    }
}

class Book:Object{
    @objc dynamic var title:String = ""
    //list는 dynamic 안쓰는 추세 ( 더 찾아보기
    var pageList = List<PageObject>()
    @objc dynamic var category:String = Category.old.rawValue
    
    func add() {
        do {
            // Get the default Realm
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func delete(){
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(self)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
