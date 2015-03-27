//
// TACoutriesDelegate.m
// Copyright (c) 2015, Hariton Batkov
// All rights reserved.

#import "TACountriesDelegate.h"
#import "BLCountriesUtils.h"

@implementation TACountriesDelegate

-(NSArray *)titlesForContactsController:(BLContactsViewController *)controller {
    NSMutableArray * array = [NSMutableArray array];
    for (BLCountry * country in [BLCountriesUtils countryCodes]) {
        [array addObject:[BLContactItem itemWithTitle:country.name context:country]];
    }
    return [NSArray arrayWithArray:array];
}

-(void)contactsController:(BLContactsViewController *)controller didSelectItem:(BLContactItem *)item {
    if (self.selectedBlock) {
        BLCountry * country = item.context;
        BOOL dismiss = self.selectedBlock(country);
        if (dismiss) {
            if ([controller.navigationController.viewControllers count] != 1) {
                [controller.navigationController popViewControllerAnimated:YES];
            } else {
                [controller dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
}

-(void)contactsControllerDidCancel:(BLContactsViewController *)controller {
    if (self.cancelBlock)
        self.cancelBlock();
}

-(UITableViewCell *)contactsController:(BLContactsViewController *)controller
                 cellForCellIdentifier:(NSString *)cellIdentifier
                                search:(BOOL)search {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                                    reuseIdentifier:cellIdentifier];
    return cell;
}

-(void)contactsController:(BLContactsViewController *)controller
          willDisplayCell:(UITableViewCell *)cell
                  forItem:(BLContactItem *)item
                   search:(BOOL)search {
    BLCountry * country = item.context;
    cell.textLabel.text = country.name;
    if (!search)
        cell.detailTextLabel.text = [NSString stringWithFormat:@"+%li", country.code];
}

@end
