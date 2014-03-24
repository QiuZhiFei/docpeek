#import "MainPanelController.h"
#import "Path.h"
#import "PathCollection.h"
#import "AppDelegate.h"

@interface MainPanelController ()

@end

@implementation MainPanelController

- (id)initWithWindowNibName:(NSString *)windowNibName
{
    self = [super initWithWindowNibName:windowNibName owner:self];
    if (self) {
        NSLog(@"hi");        
    }
    return self;
}
- (void) awakeFromNib
{
    NSPanel* panel = (NSPanel*)[self window];
    [panel setOpaque:NO];

    [panel setBackgroundColor:[NSColor clearColor]];
    [tableView setDelegate:self];
    [tableView setDataSource: self];
}

- (IBAction) openAddPathDialog:(id) sender
{
    keepWindowOpen = YES;
    NSOpenPanel * openPanel = [NSOpenPanel new];
    NSArray * fileTypes = [NSArray arrayWithObjects:@"pdf", nil];
    [openPanel setAllowedFileTypes:fileTypes];
    [openPanel setAllowsMultipleSelection:YES];
    [openPanel runModal];
    NSArray * urls = [openPanel URLs];
    if (urls.count == 0) return;
    for (NSURL* url in urls)
    {
        Path* path = [Path new];
        [path setName:[url lastPathComponent]];
        [path setUrl:[url filePathURL]];
        [[[NSApp delegate] pathCollection] addPath: path];
    }
    [tableView reloadData];
    keepWindowOpen = NO;
}
- (IBAction) removePath:(id) sender;
{
    PathCollection* paths = [[NSApp delegate] pathCollection];
    NSIndexSet * rowIndexes = [tableView selectedRowIndexes];
    
    NSInteger index = [rowIndexes firstIndex];
    
    while (index != NSNotFound){
        [paths removeAt:index];
        index = [rowIndexes indexGreaterThanIndex:index];
    }
    [tableView reloadData];
}

- (void) cancelOperation:(id)sender
{
    [self close];
}

- (void) activateViewer
{
    NSLog(@"activating viewer");
    [[pdfViewer window] makeFirstResponder:nil];
}

- (void) show
{
    NSWindow* window = [self window];
    [window setAlphaValue:0];
    NSRect rect = [window frame];

    NSScreen * screen = [NSScreen screens][0];
    rect.origin.x = screen.frame.size.width - rect.size.width;
    rect.origin.y = screen.frame.size.height - rect.size.height-[[NSStatusBar systemStatusBar] thickness];
    [window setFrame:rect display:NO];
    [[window animator] setAlphaValue:1];
    [backgroundView setArrowX:100];
    
    [NSApp activateIgnoringOtherApps:YES];
    [window makeKeyAndOrderFront:self];

}
# pragma NSWindowDelegate

- (void)windowDidResignKey:(NSNotification *) notification;
{
    if ([[self window] isVisible] && !keepWindowOpen)
    {
        [[self window] close];
    }
}

- (BOOL) windowShouldClose:(id)sender
{
    NSLog(@"closing");
    return YES;
}

# pragma NSTableViewDelegate

- (void) tableViewSelectionDidChange:(NSNotification *)notification
{
    NSLog(@"selection changed");
    NSInteger selectionIndex = [tableView selectedRow];
    if (selectionIndex == -1) return;
    Path* path = [[[NSApp delegate] pathCollection] getByIndex:selectionIndex];
    [pdfViewer setDocumentFromPath:[path url]];
}

#pragma NSTableViewDataSource


- (NSInteger) numberOfRowsInTableView:(NSTableView *)tableView
{
    return [[[NSApp delegate] pathCollection] count];
}

- (id) tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    PathCollection* paths = [[NSApp delegate] pathCollection];
    Path * path = [paths getByIndex:row];
    if ([[tableColumn identifier]  isEqual: @"Name"])
    {
        return [path name];
    }
    return [path url];
}

- (void) tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    PathCollection* paths = [[NSApp delegate] pathCollection];
    Path * path = [paths getByIndex:row];
    if ([[tableColumn identifier]  isEqual: @"Name"])
    {
        [path setName:object];
    }
}

@end
