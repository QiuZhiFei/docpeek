#import "MenuBarController.h"
#import "StatusItemView.h"
#import "AppDelegate.h"

@implementation MenuBarController

- (id) init
{
    self = [super init];
    if (self != nil){
        CGFloat thickness = [[NSStatusBar systemStatusBar] thickness];
        NSStatusBar* statusBar = [NSStatusBar systemStatusBar];
        self.item = [statusBar statusItemWithLength:thickness];
        StatusItemView* statusItemView = [[StatusItemView alloc] initWithFrame:(NSRect){.size={thickness, thickness}}];
        [statusItemView setDelegate:self];
        [self.item setView:statusItemView];
    }
    return self;
}

- (void) iconClicked
{
    NSLog(@"icon clicked");
    [[NSApp delegate] showPanel];
}


@end
