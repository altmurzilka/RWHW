//
//  Observer.swift
//  Birdie_MyAttempt
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI
import CoreData

class Observer : ObservableObject{
    
    @Published var datas = [type]()
    
    init() {
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "NewModel")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in  res as! [NSManagedObject]{
                
                let msg = i.value(forKey: "msg") as! String
                let author = i.value(forKey: "author") as! String
                let time = i.value(forKey: "time") as! String
                let day = i.value(forKey: "day") as! String
                let id = i.value(forKey: "id") as! String
                
                self.datas.append(type(id: id, author: author, msg: msg, time: time, day: day))
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
        
    }
    
    func add(author : String,msg: String,date: Date){
        
        
        let format = DateFormatter()
        format.dateFormat = "dd MMM"
        let day = format.string(from: date)
        format.dateFormat = "hh:mm"
        let time = format.string(from: date)
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: "NewModel", into: context)
        entity.setValue(msg, forKey: "msg")
        entity.setValue(author, forKey: "author")
        entity.setValue("\(date.timeIntervalSince1970)", forKey: "id")
        entity.setValue(time, forKey: "time")
        entity.setValue(day, forKey: "day")
        
        do{
            
            try context.save()
            self.datas.append(type(id: "\(date.timeIntervalSince1970)", author: author, msg: msg, time: time, day: day))
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
    
    func delete(id : String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "NewModel")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in  res as! [NSManagedObject]{
                
                if i.value(forKey: "id") as! String == id{
                    
                    context.delete(i)
                    try context.save()
                    
                    for i in 0..<datas.count{
                        
                        if datas[i].id == id{
                            
                            datas.remove(at: i)
                            return
                            
                        }
                    }
                }
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
    
    func update(id : String, msg: String, author : String){
        
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "NewModel")
        
        do{
            
            let res = try context.fetch(req)
            
            for i in  res as! [NSManagedObject]{
                
                if i.value(forKey: "id") as! String == id{
                    
                    i.setValue(msg, forKey: "msg")
                    i.setValue(author, forKey: "author")
                    
                    try context.save()
                    
                    for i in 0..<datas.count{
                        
                        if datas[i].id == id{
                            
                            datas[i].msg = msg
                            datas[i].author = author
                        }
                    }
                }
            }
        }
        catch{
            
            print(error.localizedDescription)
        }
    }
}
