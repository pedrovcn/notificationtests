//
//  PDFViewController.swift
//  notificationtests
//
//  Created by Pedro Vinicius Cuêlho do Nascimento on 03/06/2019.
//  Copyright © 2019 Pedro Nascimento. All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    var url: URL!
    var name: String!
    
    @IBOutlet var navbar: UINavigationBar!
    @IBOutlet weak var pdfView: PDFView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navbar.topItem?.title = name
        setupPDFView()
    }

    fileprivate func setupPDFView() {
        let pdfDocument = PDFDocument(url: url)
        pdfView.document = pdfDocument
        pdfView.displayMode = .singlePageContinuous
        pdfView.autoScales = true
        pdfView.displayDirection = .horizontal
    }

    @IBAction func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
