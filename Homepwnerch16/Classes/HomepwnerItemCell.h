
#import <UIKit/UIKit.h>
//#import "Possessions.h"
@class Possessions;

@interface HomepwnerItemCell : UITableViewCell {
	UILabel *valueLabel;
	UILabel *nameLabel;
	UILabel *imageView;
}
 
- (void) setPosssession:(Possessions * )possession;


@end
