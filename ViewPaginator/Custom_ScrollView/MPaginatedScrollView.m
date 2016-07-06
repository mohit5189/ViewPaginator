//
//  MPaginatedScrollView.m
//  ViewPaginator
//
//  Created by mohit.kumar on 05/07/16.
//  Copyright © 2016 TIL. All rights reserved.
//

#import "MPaginatedScrollView.h"

@interface MPaginatedScrollView () <UIScrollViewDelegate>
{
    NSInteger numberOfPages;
    NSInteger lastPage;
    NSMapTable *viewsMap;
}
@end
@implementation MPaginatedScrollView

-(void)layoutSubviews{

    [super layoutSubviews];
    
    
}

-(void)awakeFromNib{

    lastPage = 0; // Initially page will be 0
    viewsMap = [[NSMapTable alloc] init];

    numberOfPages =[_scrollViewDataSource numberOfPagesInScrollView];
    self.contentSize = CGSizeMake(self.frame.size.width*numberOfPages, self.frame.size.height);
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.delegate = self;
    // Initially load 2 pages
    [self loadPageAtIndex:0];
    [self loadPageAtIndex:1];
    
}


-(void)loadPageAtIndex:(NSInteger)index{

    if (numberOfPages>index && index>=0) {
        
        id view;
        
        if ([viewsMap objectForKey:[NSString stringWithFormat:@"%ld",index]]!=nil) {
            view = [viewsMap objectForKey:[NSString stringWithFormat:@"%ld",index]];
        }else{
             view = [_scrollViewDataSource viewForScrollViewAtIndex:index];
            [viewsMap setObject:view forKey:[NSString stringWithFormat:@"%ld",index]];
        }
        
        CGRect viewRect = [view frame];
        
        viewRect.origin.x = self.frame.size.width*index+viewRect.origin.x;
        
        [view setFrame:viewRect];
        
        [self addSubview:view];
    }

}


- (void)scrollViewDidScroll:(UIScrollView *)sender {

    int page = sender.contentOffset.x / sender.frame.size.width;
    
    if (lastPage>page) {
        [self loadPageAtIndex:page-1]; // Load previous page
        
        [self removeViewsWithCurrentIndex:lastPage+1];

    }else if (lastPage<page){
        [self loadPageAtIndex:page+1]; // Load next page
        
        [self removeViewsWithCurrentIndex:lastPage-1];

    }
    
    lastPage = page;
    
}


-(void)removeViewsWithCurrentIndex:(NSInteger)currentIndex{
    
    id view = [viewsMap objectForKey:[NSString stringWithFormat:@"%ld",currentIndex]];
    
    if (view) {
        
        [view removeFromSuperview];
        
        [viewsMap removeObjectForKey:[NSString stringWithFormat:@"%ld",currentIndex]];
        
        if ([self.scrollViewDelegate respondsToSelector:@selector(viewRemoved:forIndex:)]) {
            [self.scrollViewDelegate viewRemoved:view forIndex:currentIndex];
        }

    }
}

@end
