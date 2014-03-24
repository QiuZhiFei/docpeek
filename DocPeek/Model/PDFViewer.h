#import <Quartz/Quartz.h>
#import <Cocoa/Cocoa.h>

@interface PDFViewer : PDFView
{

@private
    NSDictionary * documentCache;
}

- (void) setDocumentFromPath: (NSURL *) fileURL;

@end
