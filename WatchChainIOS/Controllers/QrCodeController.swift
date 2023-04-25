//
//  QrCodeController.swift
//  WatchChainIOS
//
//  Created by Alexej K on 25.04.23.
//

import UIKit
import VisionKit

class QrCodeController: UIViewController {
    
    /// Checks if `isSupported` and `isAvailable`
    var scannerAvailable: Bool {
        DataScannerViewController.isSupported && DataScannerViewController.isAvailable
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startScanningPressed(_ sender: Any) {
        guard scannerAvailable == true else {
            print("Error: Scanner is not available for usage. Please check settings.")
            return
        }
        
        let dataScanner = DataScannerViewController(recognizedDataTypes: [.text(), .barcode()], isHighlightingEnabled: true)
        present(dataScanner, animated: true) {
            try? dataScanner.startScanning()
        }
    }
}

extension QrCodeController: DataScannerViewControllerDelegate {
    
    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item : RecognizedItem) {
        switch item {
        case .text(let text):
            print("text: \(text.transcript)")
            UIPasteboard.general.string = text.transcript
        case .barcode(let code):
            guard let urlString = code.payloadStringValue else { return }
            guard let url = URL(string: urlString) else { return }
            UIApplication.shared.open(url)
        default:
            print("Unexpected item.")
        }
    }
}
