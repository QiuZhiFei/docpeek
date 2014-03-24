#import <Cocoa/Cocoa.h>
#import "MenuBarController.h"
#import "MainPanelController.h"
#import "PathCollection.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property MenuBarController * menuBarController;
@property MainPanelController * mainPanelController;

@property PathCollection * pathCollection;

- (void) showPanel;

@end
