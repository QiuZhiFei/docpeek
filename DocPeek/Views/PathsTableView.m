#import "PathsTableView.h"
#import "MainPanelController.h"

@implementation PathsTableView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}
//
//- (void) keyDown:(NSEvent *)theEvent
//{
//    NSLog(@"key down");
//   // if ([theEvent keyCode] == 124) [(MainPanelController *) [self delegate] activateViewer];
//}

@end
