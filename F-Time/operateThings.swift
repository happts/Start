//
//  thingsUsing.swift
//  F-Time
//
//  Created by happts on 17/7/22.
//  Copyright © 2017年 jndxttt. All rights reserved.
//

import Foundation
import UIKit
import CoreData



//User对象创建成功之后，接下来就是通过对象来使用CoreData了
class HandleCoreData: NSObject {
    
    struct OneThing {
        var name:String
        var starttime:String
        var endtime:String
        var priority:Bool
        var remark = ""
    }
    //1、插入数据的具体操作如下
    /*
     * 通过AppDelegate单利来获取管理的数据上下文对象，操作实际内容
     * 通过NSEntityDescription.insertNewObjectForEntityForName方法创建实体对象
     * 给实体对象赋值
     * 通过saveContext()保存实体对象
     */
    func insertData(one:OneThing){
        
        //获取数据上下文对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        //创建user对象
        let EntityName = "Things"
        let thing = NSEntityDescription.insertNewObject(forEntityName: EntityName, into:context) as! Things
        
        //对象赋值
        thing.name = one.name
        thing.startTime = one.starttime
        thing.endTime = one.endtime
        thing.priority = one.priority
        thing.remark = one.remark
        
        //保存
        app.saveContext()
    }
    
    
    //2、查询数据的具体操作如下
    /*
     * 利用NSFetchRequest方法来声明数据的请求，相当于查询语句
     * 利用NSEntityDescription.entityForName方法声明一个实体结构，相当于表格结构
     * 利用NSPredicate创建一个查询条件，并设置请求的查询条件
     * 通过context.fetch执行查询操作
     * 使用查询出来的数据
     */
    func queryData(){
        print("调用成功")
        //获取数据上下文对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        //声明数据的请求
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.fetchLimit = 10  //限制查询结果的数量
        fetchRequest.fetchOffset = 0  //查询的偏移量
        
        //声明一个实体结构
        let EntityName = "Things"
        let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        fetchRequest.entity = entity
            
            //设置查询条件
//        ?let predicate = NSPredicate.init(format: "userID = '2'", "")
//        fetchRequest.predicate = predicate
        
        //查询操作
        do{
            let fetchedObjects = try context.fetch(fetchRequest) as! [Things]
            
            //遍历查询的结果
            for info:Things in fetchedObjects{
                
                print("userID = \(info.name)")
                print("userEmail = \(info.startTime)")
                print("userPwd = \(info.endTime)")
                print("+++++++++++++++++++++++++")
            }
        }catch {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
    }
    
    
    //3、修改数据的具体操作如下
    /*
     * 利用NSFetchRequest方法来声明数据的请求，相当于查询语句
     * 利用NSEntityDescription.entityForName方法声明一个实体结构，相当于表格结构
     * 利用NSPredicate创建一个查询条件，并设置请求的查询条件
     * 通过context.fetch执行查询操作
     * 将查询出来的数据进行修改,也即进行赋新值
     * 通过saveContext()保存修改后的实体对象
 
    func updateData(){
        
        //获取数据上下文对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        //声明数据的请求
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.fetchLimit = 10  //限制查询结果的数量
        fetchRequest.fetchOffset = 0  //查询的偏移量
        
        //声明一个实体结构
        let EntityName = "Things"
        let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        fetchRequest.entity = entity
            
            //设置查询条件
        ? let predicate = NSPredicate.init(format: "userID = '2'", "")
        fetchRequest.predicate = predicate
        
        //查询操作
        do{
            let fetchedObjects = try context.fetch(fetchRequest) as! [Things]
            
            //遍历查询的结果
            for info:Things in fetchedObjects{
                //修改邮箱
                ? //info.userEmail = "xyq@163.com"
                
                //重新保存
                app.saveContext()
            }
        }catch {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
    }
    */
    
    
    //4、删除数据的具体操作如下
    /*
     * 利用NSFetchRequest方法来声明数据的请求，相当于查询语句
     * 利用NSEntityDescription.entityForName方法声明一个实体结构，相当于表格结构
     * 利用NSPredicate创建一个查询条件，并设置请求的查询条件
     * 通过context.fetch执行查询操作
     * 通过context.delete删除查询出来的某一个对象
     * 通过saveContext()保存修改后的实体对象
     */
    class func deleteData(){
        
        //获取数据上下文对象
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        //声明数据的请求
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.fetchLimit = 10  //限制查询结果的数量
        fetchRequest.fetchOffset = 0  //查询的偏移量
        
        //声明一个实体结构
        let EntityName = "Things"
        let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        fetchRequest.entity = entity
            
            //设置查询条件
//        ? let predicate = NSPredicate.init(format: "userID = '2'", "")
//        fetchRequest.predicate = predicate
        
        //查询操作
        do{
            let fetchedObjects = try context.fetch(fetchRequest) as! [Things]
            
            //遍历查询的结果
            for info:Things in fetchedObjects{
                //删除对象
                context.delete(info)
                
                //重新保存
                app.saveContext()
            }
        }catch {
            let nserror = error as NSError
            fatalError("查询错误： \(nserror), \(nserror.userInfo)")
        }
    }
}
