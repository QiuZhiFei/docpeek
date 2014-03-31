#import <Cocoa/Cocoa.h>
#import "BackgroundView.h"
#import "PDFViewer.h"
#import "PathsTableView.h"

@interface MainPanelController : NSWindowController <NSWindowDelegate, NSTableViewDataSource, NSTableViewDelegate>{
@private
    IBOutlet NSButton * button;
    IBOutlet NSSlider * slide;
    IBOutlet BackgroundView * backgroundView;
    IBOutlet PDFViewer * pdfViewer;
    IBOutlet PathsTableView * tableView;
    
    BOOL keepWindowOpen;
    
}
- (void) show:(NSInteger) arrowX;
- (void) activateViewer;
- (IBAction) openAddPathDialog:(id) sender;
- (IBAction) removePath:(id) sender;
@end
