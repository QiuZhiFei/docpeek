#import "AppDelegate.h"
#import "MainPanelController.h"
#import "PathCollection.h"

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    _pathCollection = [PathCollection new];
    _menuBarController = [MenuBarController new];
    
}

- (void) showPanel
{
    NSLog(@"showing panel");
    if (_mainPanelController == nil)
        _mainPanelController = [[MainPanelController alloc] initWithWindowNibName:@"MainPanel"];
    
    [_mainPanelController show];
}



@end
