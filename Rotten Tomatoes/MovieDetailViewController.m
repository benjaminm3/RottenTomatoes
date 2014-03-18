//
//  MovieDetailViewController.m
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/16/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *movieDetailScrollView;
@property (strong, nonatomic) IBOutlet UIView *movieDetailView;

@end

@implementation MovieDetailViewController
@synthesize movie;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = movie.title;
    self.synopsis.text = movie.synopsis;
    [self.posterImage setImageWithURL:[NSURL URLWithString:movie.posterUrl]];
    for (Cast *cast in movie.cast) {
        Cast *lastCast = movie.cast.lastObject;
        self.castList.text = [self.castList.text stringByAppendingString:cast.name];
        if (![cast.name isEqual:lastCast.name]) {
          self.castList.text = [self.castList.text stringByAppendingString:@", "];
        }
    }

}

- (void)viewDidAppear
{
   [self.movieDetailScrollView addSubview:self.movieDetailView];//if the contentView is not already inside your scrollview in your xib/StoryBoard doc
    
    self.movieDetailScrollView.contentSize = self.movieDetailView.frame.size;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setMovie:(Movie *)movieVar{
    movie = movieVar;
   
}

@end
