//
//  MovieCell.m
//  Rotten Tomatoes
//
//  Created by Benjamin Chang on 3/16/14.
//  Copyright (c) 2014 Benjamin Chang. All rights reserved.
//

#import "MovieCell.h"


@interface MovieCell ()
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsisLabel;
@property (weak, nonatomic) IBOutlet UIView *movieDetailView;

@end


@implementation MovieCell
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public methods

-(void)setMovie:(Movie *)movie{
    _movie = movie;
    self.movieTitleLabel.text = movie.title;
    self.movieSynopsisLabel.text = movie.synopsis;
    [self.thumbnailView setImageWithURL:[NSURL URLWithString:movie.thumbnailUrl]];
    self.thumbnailView.contentMode = UIViewContentModeScaleAspectFit;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}
@end
