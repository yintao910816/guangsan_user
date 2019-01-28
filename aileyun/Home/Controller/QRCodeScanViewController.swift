//
//  QRCodeScanViewController.swift
//  aileyun
//
//  Created by huchuang on 2017/10/18.
//  Copyright © 2017年 huchuang. All rights reserved.
//

import UIKit
import AVKit

//class QRCodeScanViewController: BaseViewController {
//
//    lazy var containerV : UIView = {
//        let c = UIView.init(frame: CGRect.init(x: (SCREEN_WIDTH - 300) / 2, y: (SCREEN_HEIGHT - 380) / 2, width: 300, height: 300))
//
//        let img = UIImage.init(named: "qrcode_border")
//        let borderimg = img?.stretchableImage(withLeftCapWidth: Int((img?.size.width)!) / 2, topCapHeight: Int((img?.size.height)!) / 2)
//        let imgV = UIImageView.init(image: borderimg)
//        imgV.frame = c.bounds
//        c.addSubview(imgV)
//
//        return c
//    }()
//
//    lazy var scanImgV : UIImageView = {
//        let s = UIImageView.init(image: UIImage.init(named: "qrcode_scan"))
//        return s
//    }()
//
//    lazy var input : AVCaptureDeviceInput? = {
//        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
//        let i = try? AVCaptureDeviceInput.init(device: device)
//        return i
//    }()
//
//    lazy var output : AVCaptureMetadataOutput = {
//        let o = AVCaptureMetadataOutput.init()
//        return o
//    }()
//
//    lazy var session : AVCaptureSession = {
//        let s = AVCaptureSession.init()
//        s.sessionPreset = AVCaptureSessionPresetHigh
//        return s
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        notNeedSeparateV()
//
//        self.navigationItem.title = "扫一扫"
//
//        initUI()
//        prepareForScan()
//        startScan()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        if !session.isRunning{
//            session.startRunning()
//        }
//        startAnimation()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        session.stopRunning()
//    }
//
//
//    func initUI(){
//        self.view.addSubview(containerV)
//        scanImgV.frame = containerV.bounds
//        containerV.addSubview(scanImgV)
//
//        let infoL = UILabel.init()
//        infoL.text = "请将二维码放入框内扫描"
//        infoL.font = UIFont.init(name: kReguleFont, size: 16)
//        infoL.textColor = UIColor.white
//
//        self.view.addSubview(infoL)
//        infoL.snp.updateConstraints { (make) in
//            make.top.equalTo(containerV.snp.bottom).offset(20)
//            make.centerX.equalTo(containerV)
//            make.height.equalTo(20)
//        }
//    }
//
//    func prepareForScan(){
//        let viewRect = self.view.frame
//        let containerRect = containerV.frame
//
//        let x = containerRect.origin.y / viewRect.size.height
//        let y = containerRect.origin.x / viewRect.size.width
//        let width = containerRect.size.height / viewRect.size.height
//        let height = containerRect.size.width / viewRect.size.width
//
//        output.rectOfInterest = CGRect.init(x: x, y: y, width: width, height: height)
//    }
//
//    func startScan(){
//        guard session.canAddInput(input) else {
//            HCShowError(info: "未能获取摄像头")
//            return
//        }
//        session.addInput(input)
//
//        guard session.canAddOutput(output) else {
//            return
//        }
//        session.addOutput(output)
//
//        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.global())
//
//        let previewLayer = AVCaptureVideoPreviewLayer.init(session: session)
//        previewLayer?.frame = self.view.frame
//        self.view.layer.insertSublayer(previewLayer!, at: 0)
//
//        session.startRunning()
//    }
//
//    func isURL(content : String?){
//        guard let s = content else{
//            HCPrint(message: content)
//            HCShowError(info: "二维码无效")
//            self.navigationController?.popViewController(animated: true)
//            return
//        }
//        let urlRegex = "((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
//        let predt = NSPredicate.init(format: "SELF MATCHES %@", urlRegex)
//        if predt.evaluate(with:s){
//            let webVC = WebViewController()
//            webVC.url = s
//            self.navigationController?.pushViewController(webVC, animated: true)
//        }else{
//            HCShowError(info: "二维码无效")
//            self.navigationController?.popViewController(animated: true)
//        }
//    }
//
//    func startAnimation(){
//        scanImgV.frame = CGRect.init(x: 0, y: 0, width: 300, height: 0)
//        self.view.layoutIfNeeded()
//
//        UIView.animate(withDuration: 2) {[weak self]()in
//            UIView.setAnimationRepeatCount(MAXFLOAT)
//            self?.scanImgV.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
//            self?.view.layoutIfNeeded()
//        }
//    }
//}
//
//extension QRCodeScanViewController : AVCaptureMetadataOutputObjectsDelegate {
//    func captureOutput(_ output: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
//        guard let any = metadataObjects.last else{return}
//        session.stopRunning()
//
//        let obj = any as AnyObject
//
//        DispatchQueue.main.async {
//            self.isURL(content: obj.stringValue)
//        }
//
//    }
//}

class QRCodeScanViewController: BaseViewController {
    
    lazy var qRScanView: LBXScanView = {
        let _qRScanView = LBXScanView.init(frame: self.view.bounds, style: self.zhiFuBaoStyle())!
        return _qRScanView
    }()

    lazy var zxingObj: ZXingWrapper = {
        let videoView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        videoView.backgroundColor = .clear
        self.view.insertSubview(videoView, at: 0)
        let _zxingObj = ZXingWrapper.init(preView: videoView, block: { [weak self] (barcodeFormat, str, scanImg) in
            self?.scanResult(str ?? "")
        })
        return _zxingObj!
    }()

    //    lazy var remindLabel: UILabel = {
    //        let scanRect = LBXScanView.getZXingScanRect(withPreView: self.view, style: self.zhiFuBaoStyle())
    //
    //        let text = UILabel.init(frame: CGRect.init(x: 20, y: scanRect.origin.y + 20, width: self.view.bounds.width - 2 * 20, height: 20))
    //        text.textAlignment = .center
    //        text.text = "将扫描框对准二维码，即可自动扫描"
    //        text.font = UIFont.systemFont(ofSize: 15)
    //        text.textColor = .black //RGB(54, 54, 54)
    //        return text
    //    }()

    deinit {
        HCPrint(message: "\(self) 释放了")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        notNeedSeparateV()

        self.navigationItem.title = "扫一扫"

        view.backgroundColor = .black
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if canUseSystemCamera() == true && qRScanView.superview == nil {
            view.addSubview(qRScanView)

            //            view.addSubview(remindLabel)

            qRScanView.startDeviceReadying(withText: "正在启动摄像头...")

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: { [weak self] in
                self?.zxingObj.start()
                self?.qRScanView.startScanAnimation()
                self?.qRScanView.stopDeviceReadying()
            })
        } else if canUseSystemCamera() == true && qRScanView.superview != nil {
            zxingObj.start()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if navigationController?.viewControllers.contains(self) == false {
            zxingObj.stop()

            qRScanView.stopScanAnimation()
        }
    }

    fileprivate func canUseSystemCamera() ->Bool {
        let authStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
        if authStatus == .restricted || authStatus == .denied {
            HCShowError(info: "未能获取摄像头")
            return false
        }
        return true
    }

    // 模仿支付宝
    func zhiFuBaoStyle() ->LBXScanViewStyle{
        //设置扫码区域参数
        let scanStyle = LBXScanViewStyle.init()
        scanStyle.centerUpOffset = 60
        scanStyle.xScanRetangleOffset = 30

        if (PPScreenH <= 480 ){
            //3.5inch 显示的扫码缩小
            scanStyle.centerUpOffset = 40
            scanStyle.xScanRetangleOffset = 20
        }

        scanStyle.notRecoginitonArea = RGB(0, 0, 0, 0.6)
        scanStyle.photoframeAngleStyle = .inner
        scanStyle.photoframeLineW = 2.0
        scanStyle.photoframeAngleW = 16
        scanStyle.photoframeAngleH = 16

        scanStyle.isNeedShowRetangle = false
        scanStyle.anmiationStyle = .netGrid

        //使用的支付宝里面网格图片
        scanStyle.animationImage = UIImage.init(named: "CodeScan.bundle/qrcode_scan_full_net")

        return scanStyle
    }
}

extension QRCodeScanViewController:AVCaptureMetadataOutputObjectsDelegate {

    func scanResult(_ result: String) {
        let urlRegex = "((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)"
        let predt = NSPredicate.init(format: "SELF MATCHES %@", urlRegex)
        if predt.evaluate(with:result){
            let webVC = WebViewController()
            webVC.url = result
            self.navigationController?.pushViewController(webVC, animated: true)
        }else{
            HCShowError(info: "二维码无效")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

