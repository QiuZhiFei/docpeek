#import <Cocoa/Cocoa.h>

@protocol MenuBarDelegate
- (void) iconClicked;
@end

@interface MenuBarController : NSController <MenuBarDelegate>
@property NSStatusItem* item;


@end
