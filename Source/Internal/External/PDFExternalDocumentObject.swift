//
//  PDFExternalDocumentObject.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 12.08.19.
//

import Foundation
import CoreGraphics

internal class PDFExternalDocumentObject: PDFRenderObject {

    internal var url: URL
    internal var pages: [Int]

    internal init(url: URL, pages: [Int]) {
        self.url = url
        self.pages = pages
    }

    override internal func calculate(generator: PDFGenerator, container: PDFContainer) throws -> [PDFLocatedRenderObject] {
        var result: [PDFLocatedRenderObject] = []

        guard let cgPDF = CGPDFDocument(url as CFURL) else {
            throw PDFError.externalDocumentURLInvalid(url: url)
        }

        for i in pages {
            guard let page = cgPDF.page(at: i) else {
                throw PDFError.pageOutOfBounds(index: i)
            }
            result.append((container, PDFExternalPageObject(page: page)))
        }

        return result
    }

    /**
     TODO: documentation
     */
    override internal var copy: PDFRenderObject {
       PDFExternalDocumentObject(url: self.url, pages: self.pages)
    }
}
