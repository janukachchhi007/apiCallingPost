//
//  ViewController.swift
//  apiCallingPost
//
//  Created by R94 on 23/03/23.
//

import UIKit
import Alamofire

struct postApi : Codable
{
    var id:String
    var createdAt:String
   
}
class ViewController: UIViewController {

// var arr : [postApi] = []
    
    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var t2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func saveButtonAction(_ sender: UIButton) {
        getData(name: t1.text ?? "" , job: t2.text ?? "")
    }
}
func getData(name:String,job:String)
         {
             let perameter:[String: Any] = ["name": name,"job": job]
             let header:HTTPHeaders = ["Content-Type" : "application/from-data"]
             AF.request("https://reqres.in/api/users",method: .post,parameters: perameter,headers: header).responseData { responce in
             switch responce.result {
            case.success(let data):
            do
            {
                let arr = try JSONDecoder().decode(postApi.self, from: data)
                print(arr)
            }
                 catch{
               print(error.localizedDescription)
          }
          case .failure(let error):
                print(error.localizedDescription)
               }
            }

         }


