#import "StatusItemView.h"

@implementation StatusItemView

@synthesize delegate;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)rect
{
	rect = CGRectInset(rect, 2, 2);
    
    [[NSColor blackColor] set];

    NSRectFill(rect);
}

- (void) mouseDown:(NSEvent *)theEvent
{
    NSLog(@"down");
    [self.delegate iconClicked];
}

@end
