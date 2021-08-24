//
//  AcessoBioCamera.swift
//  acessobio_plugin
//
//  Created by Lucas Diniz Silva on 26/02/21.
//

class AcessoBioCamera: AcessoBioView, AcessoBioSelfieDelegate, SelfieCameraDelegate {

    override func callMethodBio(){
        switch method {
            
            case MethodConstansts.openCamera: unicoCheck.build().prepareSelfieCamera(self)
            
            default: flutterResult(FlutterMethodNotImplemented)
        }
    }
    
    func onCameraReady(_ cameraOpener: AcessoBioCameraOpenerDelegate!) {
        cameraOpener.open(self)
    }
    
    func onCameraFailed(_ message: String!) {
        
    }

    func onSuccessSelfie(_ result: SelfieResult!) {
        flutterResult(ConvertToHashMap.convertObjToDicionary(result: result))
    }
    
    func onErrorSelfie(_ errorBio: ErrorBio!) {
        flutterResult(
            FlutterError(code: ReturnCostants.onError, message: "", details: ConvertToHashMap.convertObjToDicionary(result: errorBio))
        )
    }
}
