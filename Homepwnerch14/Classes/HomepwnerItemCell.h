
#import <UIKit/UIKit.h>
#import "Possessions.h"

@interface HomepwnerItemCell : UITableViewCell {
	UILabel *valueLabel;
	UILabel *nameLabel;
	UILabel *imageView;
}
 
- (void) setPosssession:(Possessions * )possession;


@end
