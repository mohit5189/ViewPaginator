//
//  MPaginatedScrollView.h
//  ViewPaginator
//
//  Created by mohit.kumar on 05/07/16.
//  Copyright © 2016 TIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MPaginatedScrollViewDataSource <NSObject>
-(NSInteger)numberOfPagesInScrollView;
-(id)viewForScrollViewAtIndex:(NSInteger )index;
@end

@protocol MPaginatedScrollViewDelegate <NSObject>
@optional
-(void)viewRemoved:(id)view forIndex:(NSInteger)index;

@end

@interface MPaginatedScrollView : UIScrollView

@property(nonatomic,weak) IBOutlet id<MPaginatedScrollViewDataSource> scrollViewDataSource;
@property(nonatomic,weak) IBOutlet id<MPaginatedScrollViewDelegate> scrollViewDelegate;


@end
