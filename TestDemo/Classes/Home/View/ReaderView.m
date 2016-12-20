//
//  ReaderView.m
//  TestDemo
//
//  Created by ClearWB on 16/12/14.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "ReaderView.h"
#import "ReaderTiledLayer.h"
@interface ReaderView ()


@property (nonatomic) CGPDFPageRef  pdfPage;

@end


@implementation ReaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSURL *fileUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Reader" ofType:@"pdf"]];
        CGPDFDocumentRef pdfDoc = CGPDFDocumentCreateWithURL((__bridge CFURLRef)(fileUrl));
        NSInteger page = CGPDFDocumentGetNumberOfPages(pdfDoc);
        
//        CGPDFDictionaryRef pdfDic = CGPDFDocumentGetInfo(pdfDoc);
        //    NSDictionary *info =(__bridge NSDictionary *)(pdfDic);
        
        _pdfPage = CGPDFDocumentGetPage(pdfDoc, page);
        
        CGPDFPageGetDrawingTransform(_pdfPage, kCGPDFTrimBox, [UIScreen mainScreen].bounds, 0, NO);
        
        //不能release， dealloc release
//        CGPDFDocumentRelease(pdfDoc);

        self.layer.delegate = self;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context  = UIGraphicsGetCurrentContext();
//    CGContextDrawPDFPage(ctx, _pdfPage);
    
    
    CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f); // White
    CGContextFillRect(context, CGContextGetClipBoundingBox(context)); // Fill
    CGContextTranslateCTM(context, 0.0f, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);

    CGContextConcatCTM(context, CGPDFPageGetDrawingTransform(_pdfPage, kCGPDFCropBox, self.bounds, 0, true));
    CGContextDrawPDFPage(context, _pdfPage); // Render the PDF page into the context
}

//+(Class)layerClass{
//    return [ReaderTiledLayer class];
//}
//#pragma mark - CALayerDelegate
//
//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context{
////     CGContextRef ctx  = UIGraphicsGetCurrentContext();
////    CGContextDrawPDFPage(ctx, _pdfPage);
//    
//    ReaderView *readerContentPage = self; // Retain self
//    
//    CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f); // White
//    
//    CGContextFillRect(context, CGContextGetClipBoundingBox(context)); // Fill
//    
//    //NSLog(@"%s %@", __FUNCTION__, NSStringFromCGRect(CGContextGetClipBoundingBox(context)));
//    
//    CGContextTranslateCTM(context, 0.0f, self.bounds.size.height); CGContextScaleCTM(context, 1.0f, -1.0f);
//    
//    CGContextConcatCTM(context, CGPDFPageGetDrawingTransform(_pdfPage, kCGPDFCropBox, self.bounds, 0, true));
//    
//    //CGContextSetRenderingIntent(context, kCGRenderingIntentDefault); CGContextSetInterpolationQuality(context, kCGInterpolationDefault);
//    
//    CGContextDrawPDFPage(context, _pdfPage); // Render the PDF page into the context
//    
//    if (readerContentPage != nil) readerContentPage = nil; // Release self
//
//}



//- (void)dealloc
//{
//    CGPDFPageRelease(_pdfPage), _pdfPage = NULL;
//    
////    CGPDFDocumentRelease(_PDFDocRef), _PDFDocRef = NULL;
//}



@end
