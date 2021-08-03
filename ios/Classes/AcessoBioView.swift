//
//  AcessoBioView.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 18/02/21.
//

import UIKit
import Flutter

class AcessoBioView: UIViewController, AcessoBioDelegate {
    
    
    var acessoBioManager: AcessoBioManager!
    var isOpenCamera: Bool =  false
    var flutterResult: FlutterResult!
    
    var acecessoBioStatus = true
    
    var method: String = ""
    
    var setColorSilhoutteNeutra: String? = nil
    var setColorSilhoutteSuccess: String? = nil
    var setColorSilhoutteError: String? = nil
    var setColorBackground: String? = nil
    var setColorBackgroundBoxStatus: String? = nil
    var setColorTextBoxStatus: String? = nil
    var setColorBackgroundPopupError: String? = nil
    var setColorTextPopupError: String? = nil
    var setImageIconPopupError: String? = nil
    
    var valueExtra = [String:Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAcessoBio()
        setColors()
        if(acecessoBioStatus){
            callMethodBio()
        }
            
        self.view.backgroundColor = UIColor.white;
        self.navigationController!.setToolbarHidden(false, animated: false)
    }
    
    func callMethodBio(){}
    
    private func initAcessoBio(){
        acessoBioManager = AcessoBioManager(
            viewController: self,
            url: "",
            apikey: "",
            token:""
        );
        acessoBioManager.setLanguageOrigin(LanguageOrigin.Flutter, release: "2.0.0-beta.3")
    }
    
    private func setColors(){
        if(setColorSilhoutteNeutra != "" && setColorSilhoutteNeutra != nil){
            acessoBioManager.setColorSilhoutteNeutral(self.setColorSilhoutteNeutra?.uppercased())
        }
        if(setColorSilhoutteSuccess != "" && setColorSilhoutteSuccess != nil){
            acessoBioManager.setColorSilhoutteSuccess(self.setColorSilhoutteSuccess?.uppercased())
        }
        if(setColorSilhoutteError != "" && setColorSilhoutteError != nil){
            acessoBioManager.setColorSilhoutteError(self.setColorSilhoutteError?.uppercased())
        }
        if(setColorBackground != "" && setColorBackground != nil){
            acessoBioManager.setColorBackground(self.setColorBackground?.uppercased())
        }
        if(setColorBackgroundBoxStatus != "" && setColorBackgroundBoxStatus != nil){
            acessoBioManager.setColorBackgroundBoxStatus(self.setColorBackgroundBoxStatus?.uppercased())
        }
        if(setColorTextBoxStatus != "" && setColorTextBoxStatus != nil){
            acessoBioManager.setColorTextBoxStatus(self.setColorTextBoxStatus?.uppercased())
        }
        if(setColorBackgroundPopupError != "" && setColorBackgroundPopupError != nil){
            acessoBioManager.setColorBackgroundPopupError(self.setColorBackgroundPopupError?.uppercased())
        }
        if(setColorTextPopupError != "" && setColorTextPopupError != nil){
            acessoBioManager.setColorTextPopupError(self.setColorTextPopupError?.uppercased())
        }
        if(setImageIconPopupError != "" && setImageIconPopupError != nil){
            acessoBioManager.setImageIconPopupError(self.setImageIconPopupError?.uppercased())
        }
    }
    
    
    
    func onErrorAcessoBioManager(_ error: String!) {
        acecessoBioStatus = false
        flutterResult(convertObjToDicionary(result: error,status: 2))
    }
    
    func onError(msg: String){
        flutterResult(convertObjToDicionary(result: msg,status: 0))
        dismiss(animated: true)
    }
    
    //CONVERT RESULT TO HASHMAP
    func convertObjToDicionary(result : NSObject, status: Int) -> [String:Any] {
        
        let obj: AnyClass = result.classForCoder
        var outCount : UInt32 = 0
        let properties = class_copyPropertyList(obj, &outCount)
        var dict = [String:Any]()
        
        for i in 0 ..< Int(outCount) {
            
            let property = properties?[i],

            strKey = NSString(utf8String: property_getName(property!)) as String?

            let attrs = result.value(forKey: strKey!)
            
            if(attrs != nil){
                dict[strKey!] = attrs
            }else{
                dict[strKey!] = ""
            }
              
        }
        
        dict["flutterstatus"] = status
        
        return dict

    }
    
    func convertObjToDicionary(result : Bool, status: Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        dict["flutterstatus"] = status
        
        return dict

    }
    
    func convertObjToDicionary(result : String, status: Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        dict["flutterstatus"] = status
        
        return dict

    }
    
    func convertObjToDicionary(result : Int, status: Int) -> [String:Any] {
        
        var dict = [String:Any]()
        
        dict["result"] = result
        dict["flutterstatus"] = status
        
        return dict

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(isOpenCamera){
            self.dismiss(animated: true, completion: nil)
        }
        isOpenCamera = true
    }
    
    func onErrorAcessoBioManager(_ error: ErrorBio!) {
        flutterResult(convertObjToDicionary(result: error, status: 2))
    }
    
    func userClosedCameraManually(){
        flutterResult(convertObjToDicionary(result: 0, status: -1))
    }
    
    func systemClosedCameraTimeoutSession() {
        flutterResult(convertObjToDicionary(result: 0, status: 3))
    }
    
    func systemClosedCameraTimeoutFaceInference() {
        flutterResult(convertObjToDicionary(result: 0, status: 4))
    }
    
    
}
