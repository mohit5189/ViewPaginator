//
//  ViewController.m
//  ViewPaginator
//
//  Created by mohit.kumar on 05/07/16.
//  Copyright © 2016 TIL. All rights reserved.
//

#import "ViewController.h"
#import "MPaginatedScrollView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MPaginatedScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - Scroll Datasource - 

-(NSInteger)numberOfPagesInScrollView{

    return 20;
}
-(id)viewForScrollViewAtIndex:(NSInteger )index{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    if (index%2==0) {
        [view setBackgroundColor:[UIColor greenColor]];
    }else{
        [view setBackgroundColor:[UIColor redColor]];
    }
    
    return view;
}


#pragma mark - Scroll Delegate - 


-(void)viewRemoved:(id)view forIndex:(NSInteger)index{
    
    NSLog(@"View removed for index %ld",index);
}
@end
