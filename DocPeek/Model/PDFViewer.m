
#import "PDFViewer.h"

@implementation PDFViewer


- (void) setDocumentFromPath:(NSURL *) fileURL
{
    PDFDocument * document;
    
    NSString * cached = documentCache[fileURL];
    
    if (cached == nil)
    {
        document = [[PDFDocument alloc] initWithURL: fileURL];
    }
    
    [self setDocument:document];
}


@end
