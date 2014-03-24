#import "PathTableView.h"
#import "AppDelegate.h"

@implementation PathTableView

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


- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView
{
    PathCollection * paths = [[NSApp delegate] pathCollection];
    return [paths count];
}

- (id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    PathCollection * paths = [[NSApp delegate] pathCollection];
    Path * path = [paths getByIndex:row];
    if ([[tableColumn identifier]  isEqual: @"Name"])
    {
        return [path name];
    }
    return [path url];
}

@end
